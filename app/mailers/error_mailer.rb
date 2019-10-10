# frozen_string_literal: true

class ErrorMailer < ApplicationMailer
  default from: 'Sam Ruby <depot@example.com>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.received.subject
  #
  def error(order)
    @order = order

    mail to: 'mrigney@yozu.co.uk', subject: 'Pragmatic Store Order Error'
  end
end
