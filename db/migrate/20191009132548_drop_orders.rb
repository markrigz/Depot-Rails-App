# frozen_string_literal: true

class DropOrders < ActiveRecord::Migration[6.0]
  def change
    drop_table :orders
  end
end
