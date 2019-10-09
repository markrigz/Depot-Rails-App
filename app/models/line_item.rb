# frozen_string_literal: true

class LineItem < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :cart, optional: true

  def total_price
    product.price * quantity
  end
end
