# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
Attendance.destroy_all
Event.destroy_all


user = []
event = []
attendance= []

#création des  10 user 
10.times do  |i|

	user[i]= User.create(
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name, 
		descritpion: Faker::Quote.matz, 
		password: Faker::Internet.password(min_length: 10, max_length: 20),
		email: "#{Faker::Name.middle_name}@yopmail.com"
		)

	puts "user n°#{i}"
end

#création des 10 event 
10.times do |i|

   event[i]= Event.create(
   	start_date: Faker::Time.forward(days: 26,period: :day),
   	duration: rand(10..240),
   	title: Faker::Music::Opera.rossini,
   	description: Faker::Quote.yoda,
   	price: rand(1000), location: Faker::Address.street_address, 
   	admin_id: user[rand(10)].id
   	)

	puts "event n°#{i}"
end

#création des 10 attendance 
10.times do |i|

   attendance = Attendance.create(
   	stripe_customer_id: Faker::Blockchain::Bitcoin.address, 
   	event_id: event[rand(10)].id, 
   	user_id: user[rand(10)].id
   	)
	puts "attendance n°#{i}"
end
