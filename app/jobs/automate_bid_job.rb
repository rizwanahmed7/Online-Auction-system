# frozen_string_literal: true

class AutomateBidJob < ApplicationJob
  queue_as :default
  RUN_EVERY = 30.seconds
  
  def perform(autobid, starting_amount)
    byebug
    maxbid = 0 if autobid.auctionproduct.bids.maximum(:bidamount).nil?
    user_max_bid = autobid.auctionproduct.bids.where(user_id: autobid.user_id).maximum(:bidamount)
    user_max_bid = 0 if user_max_bid.nil?
    return unless user_max_bid != maxbid
    return unless user_max_bid <= maxbid && autobid.amount > maxbid
 
 
    starting_amount = maxbid + 1
    bid = Bid.new(user_id: autobid.user_id, auctionproduct_id: autobid.auctionproduct_id,
                  bidamount: starting_amount)
    bid.save
    WinnerJob.set(wait: 30.seconds).perform_later(autobid, starting_amount + 10)
  end
end
