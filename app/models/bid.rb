# frozen_string_literal: true

class Bid < ApplicationRecord
  belongs_to :user
  belongs_to :auctionproduct
  has_many :wins, dependent: :destroy

  validates :bidamount, presence: true
  validates :bidamount, numericality: { greater_than_or_equal_to: 0 }

  validate :verify_bid_amount, on: :create

  after_save :run_find_winner_job

  private

  def run_find_winner_job
    @bid = Bid.find_by(id: id)
    check = false
    WinnerJob.perform_now(@bid, @bid.auctionproduct, Bid.count, check)
  end

  def verify_bid_amount
    return unless bidamount < auctionproduct.minproductbid
    return unless bidamount < auctionproduct.bids.maximum(:bidamount)

    errors.add(:bidamount, 'sorry you entered a low amount')
  end
end
