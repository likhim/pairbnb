class ReservationsController < ApplicationController

	def create
		@listing = Listing.find(params[:listing_id])
		@reservation = current_user.reservations.new(reservation_params)
		if @reservation.save
			redirect_to current_user
		else
			render "listings/show"
		end
	end

	def destroy
	end

	def reservation_params
		params.require(:booking).permit(:num_guests, :checkin_date, :checkout_date)
	end

end
