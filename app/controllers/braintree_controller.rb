class BraintreeController < ApplicationController
  def new
  	@client_token = Braintree::ClientToken.generate
  	@listing = Reservation.where(listing_id =params[:listing_id])
  end

  def checkout
  
  		@x = Listing.find(Reservation.find(params[:id]).listing_id)
  		@days = Reservation.find(params[:id]).end_date - Reservation.find(params[:id]).start_date

	  nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

	  result = Braintree::Transaction.sale(
	   :amount => @x.price.to_i * @days.to_i,
	   :payment_method_nonce => nonce_from_the_client,
	   :options => {
	      :submit_for_settlement => true
	    }
	   )

	  if result.success?
	    redirect_to :root, :flash => { :success => "Transaction successful!" }
	  else
	    redirect_to :root, :flash => { :error => "Transaction failed. Please try again." }
	  end
	end
end

 