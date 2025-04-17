class PurchaseController < ApplicationController
  def create
    beat = Beat.find(params[:beat_id])
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'usd',
          product_data: {
            name: beat.title,
          },
          unit_amount: (beat.price * 100).to_i,
        },
        quantity: 1,
      }],
      mode: 'payment',
      success_url: 'http://localhost:3000/success',
      cancel_url: 'http://localhost:3000/cancel'
    )

    render json: { checkout_url: session.url }
  end
end