# frozen_string_literal: true

class WinnerJob < ApplicationJob
  queue_as :default
  RUN_EVERY = 120.seconds

  def perform(bid, auctionproduct, count, check)
    maxbid1 = auctionproduct.bids.maximum(:bidamount)
    if check == true
      maxbid2 = Bid.where(auctionproduct_id: auctionproduct.id).maximum(:bidamount)
      if count == Bid.count && maxbid1 >= maxbid2 && (auctionproduct.status == 'live')
        win = bid.wins.new(user_id: bid.user_id, auctionproduct_id: auctionproduct.id)
        auctionproduct.update_attribute(:status, 'sold')
        win.save!
        NotifywinnerMailer.bid_winner(bid.user).deliver_now
        loosers = auctionproduct.bids.where.not(user_id: bid.user_id)
        loosers.each do |looser|
          NotifywinnerMailer.bid_looser(looser.user).deliver_now
        end
      end
    end
    check = true
    WinnerJob.set(wait: 120.seconds).perform_later(bid, auctionproduct, Bid.count, check)
  end
end
