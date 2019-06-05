class CheckoutMailer < ApplicationMailer
  def receipt_email
    @orderer = params[:orderer] if params[:orderer].present?
    @cart = params[:cart]
    mail(to: params[:email], subject: 'Order')
  end
end
