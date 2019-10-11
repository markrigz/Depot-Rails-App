# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_secure_password

  after_destroy :ensure_an_admin_remains

  class Error < StandardError
  end

  private

  def ensure_an_admin_remains
    raise Error, "Can't delete last user" if User.count.zero?
  end
end
