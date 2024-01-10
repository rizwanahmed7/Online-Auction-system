# frozen_string_literal: true

class Auctionproduct < ApplicationRecord
  belongs_to :user
  belongs_to :auction
  has_many :bids, dependent: :destroy
  has_many :wins, dependent: :destroy
  has_many :autobids, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many_attached :images do |image|
    image.variant :thumb, resize_to_limit: [100, 100]
  end

  enum status: { live: 1, sold: 2, delievered: 3 }

  validates :name, :minproductbid, presence: true
  validates :minproductbid, numericality: { greater_than_or_equal_to: 0 }
  validate :verify_auction_time, on: :create
  validates :name, uniqueness: { scope: :auction }

  private

  def verify_auction_time
    return unless auction.endtime < Time.zone.now

    errors.add(:minproductbid, 'Auction is already closed')
  end
end
