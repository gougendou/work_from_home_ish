# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

100.times do
  Workspace.create(
    name: Faker::Coffee.blend_name,
    price: rand(15..40),
    address: Faker::Address.full_address,
    description: Faker::Coffee.notes,
    booking_status: true
  )
end


# t.string "name"
# t.float "price"
# t.string "address"
# t.string "photo"
# t.text "description"
# t.boolean "booking_status"
