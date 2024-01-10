# frozen_string_literal: true

class Autobid < ApplicationRecord
  STARTING_AMOUNT = 1

  belongs_to :user
  belongs_to :auctionproduct

  validates :amount, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }

  after_save :run_automate_bid_job

  private

  def run_automate_bid_job
    @autobid = Autobid.find_by(id: id)
    AutomateBidJob.perform_now(@autobid, STARTING_AMOUNT)
  end
end
