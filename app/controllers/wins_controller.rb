# frozen_string_literal: true

class WinsController < ApplicationController
  def index
    @wins = Win.includes(:user, :bid, :auctionproduct).all
  end

  def win_product
    @winning_products = current_user.wins.includes(:auctionproduct).all
  end
end
