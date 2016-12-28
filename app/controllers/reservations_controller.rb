require 'byebug'

class ReservationsController < ApplicationController

	def create
		#find listing id
		@listing = Listing.find(params[:listing_id]) 
		#insert current_user id into @reservation for saving
		@reservation = current_user.reservations.new(reservation_params)
		#reservation belongs to this 1 listing at that moment in time which is your @listing
		@reservation.listing = @listing
		if @reservation.save
			redirect_to current_user
			# redirect_to @listings
		else
			@errors = @reservation.errors.full_messages
			render "listings/show"
		end
	end

	def destroy
	end

	def reservation_params
		params.require(:reservation).permit(:num_guests, :checkin_date, :checkout_date)
	end

end
