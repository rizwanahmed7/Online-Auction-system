# frozen_string_literal: true

class Auction < ApplicationRecord
  belongs_to :user, inverse_of: :auctions
  has_many :auctionproducts, dependent: :destroy

  enum status: { unapproved: 0, approved: 1 }

  validates :name, :starttime, :endtime, :minbids, presence: true
  validates :minbids, numericality: { greater_than_or_equal_to: 0 }

  validate :end_must_be_after_start, on: :create
  validate :start_must_be_before_current_time, on: :create

  before_create :set_status

  private

  def start_must_be_before_current_time
    return unless starttime < Time.zone.now

    errors.add(:starttime, 'Start time should be after current time')
  end

  def end_must_be_after_start
    return unless starttime >= endtime

    errors.add(:endtime, 'end time should be after start time')
  end

  def set_status
    self.status = 'unapproved' if user.seller?
    return unless user.admin?

    self.status = 'approved'
  end
end
