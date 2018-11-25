# Preview all emails at http://localhost:3000/rails/mailers/checkout_mailer
class CheckoutMailerPreview < ActionMailer::Preview
  def receipt_email
    CheckoutMailer.with(cart: Cart.last).receipt_email
  end
end
