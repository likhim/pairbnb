class ReminderMailer < ApplicationMailer

	default from: ENV['MY_GMAIL_USERNAME']

	def reminder_email(customer, host, reservation_id)
		
		@customer = customer
		@host = host
		@reservation_id = reservation_id
		@url = "http://google.com" #to change
		mail(to: @host.email, subject: 'Reminder: Reservation on your listing')
	end
end
