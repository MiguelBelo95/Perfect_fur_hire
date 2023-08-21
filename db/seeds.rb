# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# User.find_or_create_by(email: "user@example.com") do |u|
#   u.password = "password123"
#   u.description = "I am a dog lover"
#   u.username = "bbbdog-lover"
# end

pet_owner = User.create(
  email: "owner@example.com",
  password: "password123",
  description: "I am a dog lover and I own one",
  username: "bbbdog-lover-and-owner"
)

pet_renter = User.create(
  email: "renter@example.com",
  password: "password123",
  description: "I am a dog lover and I want to rent one",
  username: "bbbdog-lover-and-renter"
)

pet = pet_owner.pets.create(
  name: "Best Shiba Ever",
  breed: "Shiba Inu",
  description: "I am a very nice and friendly shiba inu"
)

pet.availabilities.create(
  start_date: 1.day.ago,
  end_date: 10.days.from_now
)

pet.availabilities.create(
  start_date: 50.days.from_now,
  end_date: 100.days.from_now
)

pet_renter.bookings.create(
  pet: pet,
  start_date: 2.days.from_now,
  end_date: 8.days.from_now,
  booking_note: "Super looking forward to meeting the Best Shiba Ever"
)
