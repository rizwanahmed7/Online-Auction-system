# frozen_string_literal: true

class AddRoleAndNameToUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users, bulk: true do |t|
      t.integer  :role, null: false, default: 0
      t.string :name, null: false, default: ''
    end
  end
end
