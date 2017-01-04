class ReservationJob < ActiveJob::Base
  queue_as :default

  def perform(customer, host, reservation_id)
  	ReservationMailer.booking_email(customer, host, reservation_id).deliver_now #send email after reservation is saved
	#.deliver_later > must specify in reservation_mailer
  end
end
