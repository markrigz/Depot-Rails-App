# frozen_string_literal: true

class ProductsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'products'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
