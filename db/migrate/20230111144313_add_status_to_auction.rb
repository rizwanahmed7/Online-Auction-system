# frozen_string_literal: true

class AddStatusToAuction < ActiveRecord::Migration[5.2]
  def change
    add_column :auctions, :status, :integer, null: false, default: 1
  end
end
