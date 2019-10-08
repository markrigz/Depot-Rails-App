# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description, :image_url, presence: true
  validates :title, uniqueness: true, length: { minimum: 10, message: 'must be at least 10 characters long' }
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }

  validates :image_url, allow_blank: true, format: {
    with: /\.(gif|jpg|png)\Z/i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }

  private

  # Ensure that there are no line items referencing this Product
  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line Items present')
      throw :abort
    end
  end
end
