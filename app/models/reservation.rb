class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing

  validate :check_overlapping_dates
  validate :check_max_guests
  #validate num_guest is not -ve
  #validate start_date should be after today


  def check_overlapping_dates
  	#check if new bookings overlapped with any existing bookings 
  	listing.reservations.each do |older_reservation|
  		if overlap?(self, older_reservation)
  			return errors.add(:overlapping_dates, "Dates choosen are not available")
  		end
  	end
  end

  def overlap?(x,y)
  	(x.checkin_date - y.checkout_date) * (y.checkin_date - x.checkout_date) > 0
  end

  def check_max_guests
  	max_guests = listing.max_guests
  	if num_guests > max_guests
  	errors.add(:max_guests, "Exceeded number of max guest allowed")
  	end
  end

end
