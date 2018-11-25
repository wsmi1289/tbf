class CheckoutMailer < ApplicationMailer
  def receipt_email
    @cart = params[:cart]
    mail(to: 'wsmi1289@gmail.com', subject: 'Order')
  end
end
