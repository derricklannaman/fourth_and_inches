class ChargesController < ApplicationController

  def new
  end

  def index

  end

  def create
    fee = current_user.formatted_fee * current_user.get_parents_players.count

    # Amount in cents
    calculate_stripe_fee(fee)

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @price_in_cents,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )
    # Creates the account transaction
    Transaction.create( payment: charge[:amount], user_id: current_user.id,
                        account_id: current_user.account.id )

    # Then update users as registered
    current_user.hasActiveAccount = true

    players = current_user.get_parents_players
    players.each do |player|
     player.is_registered = true
     player.save
    end


  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

end
