# frozen_string_literal: true

class Win < ApplicationRecord
  belongs_to :user
  belongs_to :bid
  belongs_to :auctionproduct
end
