# frozen_string_literal: true

class AuctionsController < ApplicationController
  before_action :auction_update, only: %i[update]
  before_action :authorize_auction, only: %i[new create update edit]
  before_action :set_auction, only: %i[edit update]

  def index
    @auctions = Auction.all
  end

  def show
    @auction = Auction.find(params[:id])
  end

  def new
    @auction = Auction.new
  end

  def edit
    @auction = Auction.find(params[:id])
  end

  def create
    auction = current_user.auctions.new(auction_params)
    if auction.save
      redirect_to auction, notice: I18n.t('success.auction')
    else
      redirect_to root_path, notice: I18n.t('failure.auction')
    end
  end

  def update
    if @auction.update(auction_update)
      redirect_to auctions_path, notice: I18n.t('update.auction')
    else
      redirect_to edit_auction_path(@auction), notice: I18n.t('notupdated.auction')
    end
  end

  private

  def authorize_auction
    authorize Auction
  end

  def auction_params
    params.require(:auction).permit(:name, :starttime, :endtime, :minbids)
  end

  def auction_update
    params.require(:auction).permit(:status)
  end

  def set_auction
    @auction = Auction.find(params[:id])
  end
end
