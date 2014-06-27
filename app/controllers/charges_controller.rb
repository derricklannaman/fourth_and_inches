class ChargesController < ApplicationController

  def new
  end

  def index

  end

  def create
    old_bal = current_user.account_balance
    calculate_stripe_fee(old_bal) # conversion in cents for stripe to process

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
    transaction = Transaction.create( payment: charge[:amount], user_id: current_user.id,
                        account_id: current_user.account.id )

    # Update account balances
    update_account_balances(transaction, old_bal)

    # Then update users as registered
    set_account_as_active
    # current_user.hasActiveAccount = true
    # current_user.save

    set_player_as_active

    # players = current_user.get_parents_players
    # players.each do |player|
    #  player.is_registered = true
    #  player.save
    # end


  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

  private

    def update_account_balances(transaction, old_bal)
      amt = transaction.payment / 100
      new_bal = old_bal - amt
      current_user.account.balance = new_bal
      current_user.account.save
    end

    def set_account_as_active
      current_user.hasActiveAccount = true
      current_user.save
    end

    def set_player_as_active
      players = current_user.get_parents_players
      players.each do |player|
       player.is_registered = true
       player.save
      end
    end







end
