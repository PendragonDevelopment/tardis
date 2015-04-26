# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# user = CreateAdminService.new.call
# puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file .env file.

user = User.create(email: "user@example.com", password: "foofoobar", name: "Test User")

user.schedule_blocks.create([{host_id: 1, event_id: 1, location_id: 1, start_time: DateTime.now, end_time: DateTime.now + 1, reservation_min: 3, reservation_max: 10, status: "open"},{host_id: 1, event_id: 1, location_id: 1, start_time: DateTime.now, end_time: DateTime.now + 1, reservation_min: 3, reservation_max: 10, status: "open"},{host_id: 1, event_id: 1, location_id: 1, start_time: DateTime.now, end_time: DateTime.now + 1, reservation_min: 3, reservation_max: 10, status: "open"},{host_id: 1, event_id: 1, location_id: 1, start_time: DateTime.now, end_time: DateTime.now + 1, reservation_min: 3, reservation_max: 10, status: "open"}])

ScheduleBlock.first.appointments.create([{attendee: 1, status: "pending"},{attendee: 2, status: "pending"},{attendee: 3, status: "pending"},{attendee: 1, status: "pending"}])