# frozen_string_literal: true

class BidsController < ApplicationController
  before_action :authorize_bid, only: %i[new create]
  before_action :set_auctionproduct, only: %i[index create]

  def index
    @bids = @auctionproduct.bids.includes(:user).all
  end

  def new
    @bid = Bid.new
  end

  def create
    @bid = @auctionproduct.bids.new(bid_param)
    @bid.user_id = current_user.id
    if @bid.save
      redirect_to auctionproduct_bids_path(@auctionproduct.id), notice: I18n.t('success.bid')
    else
      redirect_to new_auctionproduct_bid_path, notice: I18n.t('failure.bid')
    end
  end

  private

  def authorize_bid
    authorize Bid
  end

  def set_auctionproduct
    @auctionproduct = Auctionproduct.find(params[:auctionproduct_id])
  end

  def bid_param
    params.require(:bid).permit(:bidamount)
  end
end
