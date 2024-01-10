# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :auctionproduct

  validates :feedback, presence: true
end
