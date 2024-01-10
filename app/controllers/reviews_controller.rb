# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :authorize_review, only: %i[index new create]
  before_action :set_auctionproduct, only: %i[index create]

  def index
    @reviews = @auctionproduct.reviews
  end

  def new
    @review = Review.new
  end

  def create
    @review = @auctionproduct.reviews.build(review_params.merge(user_id: current_user.id))

    if @review.save
      redirect_to auctionproduct_reviews_path(@auctionproduct), notice: t('success.review')
    else
      redirect_to new_auctionproduct_review_path, notice: t('failure.review')
    end
  end

  private

  def authorize_review
    authorize Review
  end

  def set_auctionproduct
    @auctionproduct = Auctionproduct.find(params[:auctionproduct_id])
  end

  def review_param
    params.require(:review).permit(:feedback)
  end
end
