class ReservationMailer < ApplicationMailer
	# default from: 'pairbnb's email' 
	default from: ENV['MY_GMAIL_USERNAME']

	def booking_email(customer, host, reservation_id)
		@customer = customer
		@host = host
		@reservation_id = reservation_id
		@url = "http://google.com" #to change
		mail(to: @host.email, subject: 'New Reservation')
	end
end

