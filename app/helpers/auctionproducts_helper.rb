# frozen_string_literal: true

module AuctionproductsHelper
  def find_max_bid(auctionproduct)
    auctionproduct.bids.maximum(:bidamount)
  end

  def find_product_status(auctionproduct)
    return true if auctionproduct.status == 'live'
    return unless auctionproduct.status == 'sold'

    false
  end
end
