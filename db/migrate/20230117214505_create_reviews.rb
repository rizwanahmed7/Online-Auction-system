# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :auctionproduct, foreign_key: true
      t.text :feedback, null: false, default: ''

      t.timestamps
    end
  end
end
