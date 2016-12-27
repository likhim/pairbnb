require 'byebug'

class User < ActiveRecord::Base
  include Clearance::User

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.(com)/

	validates :name, presence: true
	validates :email, format: { with: VALID_EMAIL_REGEX, message: 'Please enter a valid email'}
	# validates :password, presence: true
	# validates :gender, presence: true
	# validates :phone_num, presence: true
	# validates :dob, presence: true
	# has_secure_password

	has_many :listings
	has_many :reservations

	has_many :authentications, :dependent => :destroy

	# 1. creates a user object based on info given by provider
	def self.create_with_auth_and_hash(authentication, auth_hash)
		user = User.new(name: auth_hash["info"]["name"],
		 email: auth_hash["extra"]["raw_info"]["email"],
		 remember_token: self.create_remember_token )
		user.authentications<<(authentication)
		user.save
		user
	end

	# 2. fetch fb_token 
	def fb_token
		x = self.authentications.where(:provider => :facebook).first
		return x.token unless x.nil?
	end

	def password_optional?
		true
	end

	# 3. Remember token
	private
	def self.create_remember_token
		 SecureRandom.urlsafe_base64
	end

end
