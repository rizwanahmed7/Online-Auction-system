# frozen_string_literal: true

class AddStatusToAuctionproducts < ActiveRecord::Migration[5.2]
  def change
    add_column :auctionproducts, :status, :integer, null: false, default: 1
  end
end
