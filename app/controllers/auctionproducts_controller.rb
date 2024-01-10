# frozen_string_literal: true

class AuctionproductsController < ApplicationController
  before_action :set_auction, only: %i[create]
  before_action :authorize_auction_product, only: %i[new create update edit destroy]
  before_action :set_auction_product, only: %i[show edit update destroy]
  before_action :auctionproduct_update, only: %i[update]

  def index
    @auctionproducts = policy_scope(Auctionproduct)
  end

  def show
    @auction_product_report = @auctionproduct.bids
  end

  def new
    @auctionproduct = Auctionproduct.new
  end

  def edit; end

  def create
    @auctionproduct = @auction.auctionproducts.new(auctionproduct_param)
    @auctionproduct.user_id = current_user.id
    if @auctionproduct.save
      redirect_to @auctionproduct.auction, notice: I18n.t('success.auctionproduct')
    else
      redirect_to new_auction_auctionproduct_path, notice: I18n.t('failure.auctionproduct')
    end
  end

  def update
    if @auctionproduct.update(auctionproduct_update)
      redirect_to auctionproducts_path, notice: I18n.t('update.auctionproduct')
    else
      redirect_to edit_auctionproduct_path(@auctionproduct), notice: I18n.t('notupdated.auctionproduct')
    end
  end

  def destroy
    @auctionproduct.destroy
    redirect_to root_path, notice: I18n.t('destroy.auctionproduct')
  end

  private

  def authorize_auction_product
    authorize Auctionproduct
  end

  def auctionproduct_param
    params.require(:auctionproduct).permit(:name, :minproductbid, images: [])
  end

  def set_auction_product
    @auctionproduct = Auctionproduct.find(params[:id])
  end

  def set_auction
    @auction = Auction.find(params[:auction_id])
  end

  def auctionproduct_update
    params.require(:auctionproduct).permit(:name, :minproductbid)
  end
end
