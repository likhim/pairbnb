require 'byebug'

class ReservationsController < ApplicationController

before_action :find_reservation, only: [:show, :edit, :update]

	def create
		#find listing_id
		@listing = Listing.find(params[:listing_id]) 
		#insert current_user id into @reservation for saving
		@reservation = current_user.reservations.new(reservation_params)
		#reservation belongs to this 1 listing at that moment in time which is your @listing
		@reservation.listing = @listing
		if @reservation.save
			# invoke Job by calling the method .perform then _later is to perform once queue is free
			ReservationJob.perform_later(@reservation.user, @listing.user, @reservation.id)
			# ReservationMailer will be invoke in Job - To send mailer to host once booking is saved
			redirect_to current_user #or redirect_to @listings
		else
			@errors = @reservation.errors.full_messages
			render "listings/show"
		end
	end

	def own_reservations
		@reservations = Reservation.where(user_id: params[:user_id])
	end

	def show
		@reservations = Reservation.where(user_id: params[:user_id])
	end

	def update
	end

	def destroy
	end

	def find_reservation
		@reservation = Reservation.find(params[:id])
	end

	def reservation_params
		params.require(:reservation).permit(:num_guests, :checkin_date, :checkout_date)
	end

end
