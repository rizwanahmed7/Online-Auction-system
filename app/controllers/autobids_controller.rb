# frozen_string_literal: true

class AutobidsController < ApplicationController
  before_action :authorize_autobid, only: %i[new create]
  before_action :set_auctionproduct, only: %i[create]

  def new
    @autobid = Autobid.new
  end

  def create
    @autobid = @auctionproduct.autobids.new(autobid_param)
    @autobid.user_id = current_user.id
    if @autobid.save
      redirect_to auctionproduct_bids_path(@auctionproduct.id)
    else
      redirect_to new_auctionproduct_bid_path, notice: I18n.t('failure.autobid')
    end
  end

  private

  def authorize_autobid
    authorize Autobid
  end

  def set_auctionproduct
    @auctionproduct = Auctionproduct.find(params[:auctionproduct_id])
  end

  def autobid_param
    params.require(:autobid).permit(:amount)
  end
end
