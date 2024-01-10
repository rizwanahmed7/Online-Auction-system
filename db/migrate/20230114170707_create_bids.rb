# frozen_string_literal: true

class CreateBids < ActiveRecord::Migration[5.2]
  def change
    create_table :bids do |t|
      t.references :user, foreign_key: true
      t.references :auctionproduct, foreign_key: true
      t.integer :bidamount, null: false

      t.timestamps
    end
  end
end
