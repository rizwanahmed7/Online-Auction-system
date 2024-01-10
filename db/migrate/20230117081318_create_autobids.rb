# frozen_string_literal: true

class CreateAutobids < ActiveRecord::Migration[5.2]
  def change
    create_table :autobids do |t|
      t.references :user, foreign_key: true
      t.references :auctionproduct, foreign_key: true
      t.integer :amount, null: false, default: 0

      t.timestamps
    end
  end
end
