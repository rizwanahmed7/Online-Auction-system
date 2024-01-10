# frozen_string_literal: true

class CreateAuctions < ActiveRecord::Migration[5.2]
  def change
    create_table :auctions do |t|
      t.string :name, null: false, default: '', index: { unique: true }
      t.datetime :starttime, null: false
      t.datetime :endtime, null: false
      t.integer :minbids, null: false

      t.timestamps
    end
  end
end
