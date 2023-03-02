# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require "open-uri"

User.destroy_all
Workspace.destroy_all
Booking.destroy_all

tom = User.create(
  first_name: 'tom',
  last_name: 'apted',
  email: 'test@test.com',
  password: '123456'
)

angus = User.create(
  first_name: 'angus',
  last_name: 'test1',
  email: 'test1@test.com',
  password: '123456'
)

matt = User.create(
  first_name: 'matt',
  last_name: 'test2',
  email: 'test2@test.com',
  password: '123456'
)

sam = User.create(
  first_name: 'sam',
  last_name: 'test3',
  email: 'test3@test.com',
  password: '123456'
)

puts("users created")

tom_workspace = Workspace.new(
  name: "Tom's desk",
  price: rand(15..40),
  address: "146 Clapham High St, London SW4 7UH",
  description: 'lovely desk put up for rent by tom',
  booking_status: true
)
tom_workspace.user = tom
file = URI.open("https://secure.img1-cg.wfcdn.com/im/75644953/resize-h600-w600%5Ecompr-r85/2020/202041306/Mayne+Home+Office+Computer+Desk.jpg")
tom_workspace.photos.attach(io: file, filename: "desk1.png", content_type: "image/png")
tom_workspace.save

angus_workspace = Workspace.new(
  name: "Angus' desk",
  price: rand(15..40),
  address: "14 Bohemia Pl, London E8 1DU",
  description: 'lovely desk put up for rent by angus',
  booking_status: true
)
angus_workspace.user = angus
file = URI.open("https://secure.img1-cg.wfcdn.com/im/06506657/resize-h310-w310%5Ecompr-r85/2218/221857133/charleena-computer-desk.jpg")
angus_workspace.photos.attach(io: file, filename: "desk2.png", content_type: "image/png")
angus_workspace.save

matt_workspace = Workspace.new(
  name: "Matt's desk",
  price: rand(15..40),
  address: "16-19 Upper St Martin's Ln, London WC2H 9EF",
  description: 'lovely desk put up for rent by matt',
  booking_status: true
)
matt_workspace.user = matt
file = URI.open("https://m.media-amazon.com/images/I/71k6ifp-15L._AC_SL1500_.jpg")
matt_workspace.photos.attach(io: file, filename: "desk3.png", content_type: "image/png")
matt_workspace.save

sam_workspace = Workspace.new(
  name: "Sam's desk",
  price: rand(15..40),
  address: " Arundel House, 4 Palace Green, Londra, W8 4QD",
  description: 'lovely desk put up for rent by sam',
  booking_status: true
)
sam_workspace.user = sam
file = URI.open("https://cdn.shopify.com/s/files/1/2268/9819/products/MD019-White-1-AGTC_Computer_Desk_White_A_3744x.jpg?v=1619537177")
sam_workspace.photos.attach(io: file, filename: "desk4.png", content_type: "image/png")
sam_workspace.save

puts("workspaces created")

tom_booking = Booking.new(
  start_date: DateTime.strptime("01/03/2023", "%d/%m/%Y"),
  end_date: DateTime.strptime("02/03/2023", "%d/%m/%Y"),
)
tom_booking.user = tom
tom_booking.workspace = angus_workspace
tom_booking.save

puts("test1")

angus_booking = Booking.new(
  start_date: DateTime.strptime("01/04/2023", "%d/%m/%Y"),
  end_date: DateTime.strptime("02/04/2023", "%d/%m/%Y"),
)
angus_booking.user = angus
angus_booking.workspace = matt_workspace
angus_booking.save

puts('test2')

matt_booking = Booking.new(
  start_date: DateTime.strptime("01/05/2023", "%d/%m/%Y"),
  end_date: DateTime.strptime("02/05/2023", "%d/%m/%Y"),
)
matt_booking.user = matt
matt_booking.workspace = sam_workspace
matt_booking.save

puts('test3')

sam_booking = Booking.new(
  start_date: DateTime.strptime("01/06/2023", "%d/%m/%Y"),
  end_date: DateTime.strptime("02/06/2023", "%d/%m/%Y"),
)
sam_booking.user = sam
sam_booking.workspace = tom_workspace
sam_booking.save

puts('test4')




# create_table "bookings", force: :cascade do |t|
#   t.date "start_date"
#   t.date "end_date"
#   t.bigint "workspace_id", null: false
#   t.bigint "user_id", null: false
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["user_id"], name: "index_bookings_on_user_id"
#   t.index ["workspace_id"], name: "index_bookings_on_workspace_id"

# 100.times do
# 100.times do
#   Workspace.create(
#     name: Faker::Coffee.blend_name,
#     price: rand(15..40),
#     address: Faker::Address.full_address,
#     description: Faker::Coffee.notes,
#     booking_status: true
#   )
# end


# t.string "name"
# t.float "price"
# t.string "address"
# t.string "photo"
# t.text "description"
# t.boolean "booking_status"
