require "open-uri"
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

# my_pet = Pet.new(
#   name: "Poppet",
#   breed: "Pomeranian",
#   description: "The Pomeranian is a breed of dog of the Spitz type, named after the Pomerania region in north-west Poland and north-east Germany in Central Europe. It is a toy dog breed due to its small size and is descended from larger Spitz-type dogs, specifically the German Spitz.",
#   user_id: pet_owner.id
# )

# my_pet.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# my_pet.save

pomeranian_image = URI.open("https://upload.wikimedia.org/wikipedia/commons/c/ca/Pomeranian.JPG")
poppet = pet_owner.pets.build(
  name: "Poppet",
  breed: "Pomeranian",
  description: "The Pomeranian is a breed of dog of the Spitz type, named after the Pomerania region in north-west Poland and north-east Germany in Central Europe. It is a toy dog breed due to its small size and is descended from larger Spitz-type dogs, specifically the German Spitz.",
)
poppet.image.attach(io: pomeranian_image, filename: "pomeranian.jpg", content_type: "image/jpeg")
poppet.save!

bichon_image = URI.open("https://upload.wikimedia.org/wikipedia/commons/9/93/Bichon_Fris%C3%A9_-_studdogbichon.jpg")
bubbles = pet_owner.pets.build(
  name: "Bubbles",
  breed: "Bichon Frise",
  description: "The French word bichon comes from Middle French bichon ('small dog'), a diminutive of Old French biche ('female dog', cognate with English bitch), from Old English bicce, and related to other Germanic words with the same meaning, including Old Norse bikkja, and German Betze.",
  user_id: pet_owner.id,
)
bubbles.image.attach(io: bichon_image, filename: "bichon.jpg", content_type: "image/jpeg")
bubbles.save!


teacup_puppy_image = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Full_attention_%288067543690%29.jpg/2560px-Full_attention_%288067543690%29.jpg")
tonny_the_teacup_poodle = pet_owner.pets.build(
  name: "Tonny the teacup puppy",
  breed: "Teacup puppy",
  description: "The French word bichon comes from Middle French bichon ('small dog'), a diminutive of Old French biche ('female dog', cognate with English bitch), from Old English bicce, and related to other Germanic words with the same meaning, including Old Norse bikkja, and German Betze.",
  user_id: pet_owner.id,
)
tonny_the_teacup_poodle.image.attach(io: teacup_puppy_image, filename: "teacup.jpg", content_type: "image/jpeg")
tonny_the_teacup_poodle.save!

pucchini_image = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Blue_Merle_Border_Collie._Female.jpg/1920px-Blue_Merle_Border_Collie._Female.jpg")
pucchini = pet_owner.pets.build(
  name: "Pucchini",
  breed: "border collie",
  description: "The Border Collie is a British breed of herding dog of medium size. It originates in the region of the Anglo-Scottish border, and descends from the traditional sheepdogs once found all over the British Isles. It is kept mostly as a working sheep-herding dog or as a companion animal.",
  user_id: pet_owner.id
)
pucchini.image.attach(io: pucchini_image, filename: "pucchini.jpg", content_type: "image/jpeg")
pucchini.save!


poppet.availabilities.create(
  start_date: 1.day.ago,
  end_date: 10.days.from_now
)

poppet.availabilities.create(
  start_date: 50.days.from_now,
  end_date: 100.days.from_now
)

pet_renter.bookings.create(
  pet: poppet,
  start_date: 2.days.from_now,
  end_date: 8.days.from_now,
  booking_note: "Super looking forward to meeting the Best Shiba Ever"
)
