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

# DESTROYING db
puts "Destroying all database information"
Booking.destroy_all
Availability.destroy_all
Pet.destroy_all
User.destroy_all


puts "Seeding all cute doggies..."

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
  description: "The Pomeranian is a breed of dog of the Spitz type, named after the Pomerania region in north-west Poland.",
  user_id: 1,
  address: "1 Phipp St, London EC2A 4PS"
)
poppet.image.attach(io: pomeranian_image, filename: "pomeranian.jpg", content_type: "image/jpeg")
poppet.save!

bichon_image = URI.open("https://upload.wikimedia.org/wikipedia/commons/9/93/Bichon_Fris%C3%A9_-_studdogbichon.jpg")
bubbles = pet_owner.pets.build(
  name: "Bubbles",
  breed: "Bichon Frise",
  description: "The French word bichon comes from Middle French bichon ('small dog'), a diminutive of Old French biche.",
  user_id: pet_owner.id,
  address: "1 Phipp St, London EC2A 4PS"
)
bubbles.image.attach(io: bichon_image, filename: "bichon.jpg", content_type: "image/jpeg")
bubbles.save!

teacup_puppy_image = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Full_attention_%288067543690%29.jpg/2560px-Full_attention_%288067543690%29.jpg")
tonny_the_teacup_poodle = pet_owner.pets.build(
  name: "Tonny the teacup puppy",
  breed: "Teacup puppy",
  description: "The French word bichon comes from Middle French bichon ('small dog'), a diminutive of Old French biche.",
  user_id: pet_owner.id,
  address: "88 Worship St, London EC2A 2BE"
)
tonny_the_teacup_poodle.image.attach(io: teacup_puppy_image, filename: "teacup.jpg", content_type: "image/jpeg")
tonny_the_teacup_poodle.save!

pucchini_image = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Blue_Merle_Border_Collie._Female.jpg/1920px-Blue_Merle_Border_Collie._Female.jpg")
pucchini = pet_owner.pets.build(
  name: "Pucchini",
  breed: "border collie",
  description: "The Border Collie is a British breed of herding dog of medium size. It originates in the region of the Anglo-Scottish border.",
  user_id: pet_owner.id,
  address: "37 Shad Thames, London SE1 2NJ"
)
pucchini.image.attach(io: pucchini_image, filename: "pucchini.jpg", content_type: "image/jpeg")
pucchini.save!


pet_renter.bookings.create(
  pet: poppet,
  start_date: 3.days.from_now,
  end_date: 5.days.from_now,
  booking_note: "Super looking forward to meeting the Best Shiba Ever"
)

# MIGUEL SEEDING
serra_mountain_image = URI.open("https://www.akc.org/wp-content/uploads/2017/11/Beau.jpg")
serra_mountain = pet_owner.pets.build(
  name: "Gaia",
  breed: "Estrela Mountain Dog",
  description: "The Estrela Mountain Dog is a large breed of dog from the Estrela Mountains of Portugal bred to guard herds.",
  user_id: pet_owner.id,
  address: "2 Park St, London SE1 9AD"
)
serra_mountain.image.attach(io: serra_mountain_image, filename: "serra_mountain.jpg", content_type: "image/jpeg")
serra_mountain.save!

cookie_image = URI.open("https://www.google.com/url?sa=i&url=https%3A%2F%2Fencrypted-tbn3.gstatic.com%2Flicensed-image%3Fq%3Dtbn%3AANd9GcT92DC474YTuam7e_AEWVzrZfWzJstwMDLwO7pstZb_7W1CKXzPZbKSF4nk6cxb086NaYX7YIpdB1Kp6gk&psig=AOvVaw09wbl4-WZaC37NDkNV496Y&ust=1692875546685000&source=images&cd=vfe&opi=89978449&ved=0CA8QjRxqFwoTCIiX_P7S8oADFQAAAAAdAAAAABAE")
cookie = pet_owner.pets.build(
  name: "Cookie Hermoso",
  breed: "Cocker Spaniel",
  description: "Cocker Spaniels are dogs belonging to two breeds of the spaniel dog type: the American Cocker Spaniel and the English Cocker Spaniel",
  user_id: pet_owner.id,
  address: "159 Brick Ln, London E1 6SB"
)
cookie.image.attach(io: cookie_image, filename: "cookie.jpg", content_type: "image/jpeg")
cookie.save!

koro_image = URI.open("https://web-japan.org/trends/img/pop202109_nihoninu02.jpg")
koro = pet_owner.pets.build(
  name: "koro",
  breed: "Shiba-Inu",
  description: "The Shiba-Inu is so popular that it accounts for 80% of all the Japanese dog breeds kept in Japan.",
  user_id: pet_owner.id,
  address: "9 Mercer St, London WC2H 9QJ"
)
koro.image.attach(io: koro_image, filename: "koro.jpg", content_type: "image/jpeg")
koro.save!

golden_image = URI.open("https://images.unsplash.com/photo-1611250282006-4484dd3fba6b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80")
golden = pet_owner.pets.build(
  name: "Marley",
  breed: "Golden Retriever",
  description: "The Golden Retriever is a Scottish breed of retriever dog of medium size. It is characterised by a gentle and affectionate nature.",
  user_id: pet_owner.id,
  address: "Maltby St, London SE1 3PB"
)
golden.image.attach(io: golden_image, filename: "golden.jpg", content_type: "image/jpeg")
golden.save!

choxies_image = URI.open("https://www.dailypaws.com/thmb/oIW8STkq_h-1t2RqAQHW0b_9oK0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/chiweenie-grass-479747398-2000-adc75beb620b4266affa46a0ef73113c.jpg")
choxies = pet_owner.pets.build(
  name: "Charlie",
  breed: "chiweenie",
  description: "You might call them chiweenies or choxies, but we call them adorable. In exchange for regular walks, bowls full of kibble, and lots of love.",
  user_id: pet_owner.id,
  address: "67 Redchurch St, London E2 7DJ"
)
choxies.image.attach(io: choxies_image, filename: "choxies.jpg", content_type: "image/jpeg")
choxies.save!

frenchie_image = URI.open("https://images.squarespace-cdn.com/content/v1/5abef86f7e3c3a242ca0bd46/7bb5d762-74c3-445b-97d3-4b40f5038e7b/0Y2A6620.jpg?format=2500w")
frenchie = pet_owner.pets.build(
  name: "Franco",
  breed: "French Bulldog",
  description: "The French Bulldog, French: Bouledogue Français, is a French breed of companion dog or toy dog.",
  user_id: pet_owner.id,
  address: "385 Geffrye St, London E2 8HZ"
)
frenchie.image.attach(io: frenchie_image, filename: "frenchie.jpg", content_type: "image/jpeg")
frenchie.save!

#----BEGIN NEW SEED AVAILABILITY FRIDAY DAVID
poppet.availabilities.create(
  start_date: 1.day.ago,
  end_date: 300.days.from_now
)

bubbles.availabilities.create(
  start_date: 1.day.ago,
  end_date: 300.days.from_now
)

tonny_the_teacup_poodle.availabilities.create(
  start_date: 1.day.ago,
  end_date: 300.days.from_now
)

pucchini.availabilities.create(
  start_date: 1.day.ago,
  end_date: 300.days.from_now
)

serra_mountain.availabilities.create(
  start_date: 1.day.ago,
  end_date: 300.days.from_now
)

cookie.availabilities.create(
  start_date: 1.day.ago,
  end_date: 300.days.from_now
)

koro.availabilities.create(
  start_date: 1.day.ago,
  end_date: 300.days.from_now
)

golden.availabilities.create(
  start_date: 1.day.ago,
  end_date: 300.days.from_now
)

choxies.availabilities.create(
  start_date: 1.day.ago,
  end_date: 300.days.from_now
)

choxies.availabilities.create(
  start_date: 1.day.ago,
  end_date: 300.days.from_now
)

frenchie.availabilities.create(
  start_date: 1.day.ago,
  end_date: 300.days.from_now
)
#------END OF NEW SEEDS FRI FOR AVAILABILITY

# poppet.availabilities.create(
#   start_date: 50.days.from_now,
#   end_date: 100.days.from_now
# )

puts "All doggies are now in our DB! Yayyy!!"
