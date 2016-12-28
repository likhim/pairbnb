# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

10.times do 
	User.create(
		name: Faker::Name.name, 
		email: Faker::Internet.email + ".com", 
		password: "123", 
		gender: rand(1...2), 
		phone_num:"123456789", 
		dob: Faker::Date.between(50.years.ago, Date.today)
		)
	end
puts "10 users created"


70.times do 
	Listing.create(
		user_id: rand(4...14), 
		title: Faker::Color.color_name + " house", 
		description: "abc", 
		max_guests: rand(1...7), 
		price: rand(50...200))
	end
puts "70 listings created"


# @users = []
# 10.times do 
# 	@users << User.create(name: Faker::Name.name, email: "seed@email.com", password: "123", gender: "male", phone_num:"123456789", dob: Faker::Date.between(50.years.ago, Date.today))
# end
# puts "10 users created"

# @listings = []
# 70.times do 
# 	@listings << Listing.create(user_id: rand(4...14), title: Faker::Color.color_name + " house", description: "abc", max_guests: rand(1...7), price: rand(50...200))
# end
# puts "70 listings created"
