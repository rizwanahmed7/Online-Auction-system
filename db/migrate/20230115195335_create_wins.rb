# frozen_string_literal: true

class CreateWins < ActiveRecord::Migration[5.2]
  def change
    create_table :wins do |t|
      t.references :user, foreign_key: true
      t.references :bid, foreign_key: true
      t.references :auctionproduct, foreign_key: true

      t.timestamps
    end
  end
end
