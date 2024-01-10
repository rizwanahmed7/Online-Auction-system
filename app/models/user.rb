# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :auctions, inverse_of: :user, dependent: :destroy
  has_many :auctionproducts, dependent: :destroy
  has_many :bids, dependent: :destroy
  has_many :wins, dependent: :destroy
  has_many :autobids, dependent: :destroy
  has_many :reviews, dependent: :destroy

  enum role: { admin: 0, buyer: 1, seller: 2 }

  validates :role, inclusion: { in: User.roles.keys }
end
