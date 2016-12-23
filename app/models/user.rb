class User < ActiveRecord::Base
  include Clearance::User

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.(com)/

	validates :name, presence: true
	validates :email, format: { with: VALID_EMAIL_REGEX, message: 'Please enter a valid email'}
	validates :password, presence: true
	validates :gender, presence: true
	validates :phone_num, presence: true
	validates :dob, presence: true
	# has_secure_password

	has_many :listings
	has_many :reservations

end
