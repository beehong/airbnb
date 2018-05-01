class ReservationsController < ApplicationController

	def index
		if current_user.customer?
		@reserve = current_user.reservations
		else
		@reserve = Reservation.all
		end
	end

	def new
		@reservation = Reservation.new
		@listing = Listing.find(params[:id])
	end

	def find
		@property = current_user.listings
	end



	def create

	    @reservation = Reservation.new(reservation_params)
	    if date_checker(@reservation.start_date, @reservation.end_date)
		      if @reservation.save
		        redirect_to @reservation ,notice: 'Reservation was successfully created.'
		      else
		        @listing = Listing.find(@reservation.listing_id)
		        redirect_to "/listings/#{@listing.id}/reservation/new"
		      end
	 	 end
    end
  
  
		
	end

	def date_checker(start_date,end_date)
		@reservations = Reservation.where(listing_id = params[:listing_id])
		if @reservations
			@reservations.each do |r|
				if (start_date < r.end_date && end_date >r.start_date)
					@listing = Listing.find(@reservation.listing_id)
					flash[:notice] = "Date is not available"
					redirect_to "/listings/#{@listing.id}/reservation/new"
					return false
				end
			end
		else
			return true
		end
	end

	

	private
   
    def reservation_params
      params.require(:reservation).permit(:start_date, :end_date, :price, :total, :user_id, :listing_id)
    end






