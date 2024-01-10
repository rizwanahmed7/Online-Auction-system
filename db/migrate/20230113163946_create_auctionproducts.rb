# frozen_string_literal: true

class CreateAuctionproducts < ActiveRecord::Migration[5.2]
  def change
    create_table :auctionproducts do |t|
      t.references :user, foreign_key: true
      t.references :auction, foreign_key: true
      t.string :name, null: false, default: ''
      t.integer :minproductbid, null: false
      t.index %i[auction_id name], unique: true

      t.timestamps
    end
  end
end
