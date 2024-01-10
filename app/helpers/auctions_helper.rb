# frozen_string_literal: true

module AuctionsHelper
  def check_auction_status(auction)
    return true if auction.status == 'approved' || (auction.status == 'unapproved' && current_user.role == 'admin')
    return false if auction.status == 'unapproved' && current_user.role == 'seller'
  end

  def auction_change_status_button(auction)
    return true if auction.status == 'unapproved' && current_user.role == 'admin'
  end

  def check_auction_time(auction)
    return true if auction.endtime > Time.zone.now
  end
end
