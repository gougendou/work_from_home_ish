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

puts("deleted all instatnces")

#first array white desks then black then wood then glass
ARRAY_OF_MODERN_DESKS = [["https://img1.homary.com/filters:format(webp)/mall/file/2022/03/10/918b7779a6e748a88fc342921fab5a61.jpg", "https://img1.homary.com/filters:format(webp)/mall/file/2022/06/02/c08f059343018c373f552612d7e60836.jpg", "http://cdn.home-designing.com/wp-content/uploads/2018/05/modern-minimalist-white-home-office-desk.jpg", "https://www.orderofficefurniture.co.uk/media/catalog/product/cache/b9d908a4ed8da99de86c0645b2dab50b/g/l/gl7825.jpg", "https://img1.homary.com/filters:format(webp)/fit-in/400x400/mall/file/2022/10/12/cf07ed938b0a1b02bb0a3f08765c556b.jpg", "https://static.ufurnish.com/assets%2Fproduct-images%2Fhomary%2Fonline-en-uk-13438%2F1200mm-modern-white-gold-rectangular-computer-desk-with-drawer-storage-shelf-30eb4b65.jpg", "https://img1.homary.com/filters:format(webp)/common/2022/04/02/79335ba33d8314306aae0968457b191c.jpg", "https://media.avdist.co.uk/1300xa.web/bdi/centro/6401-desk/centro_office_BDI_modern_white_desk_system_3.jpg", "https://cdn.autonomous.ai/static/upload/images/new_post/20-most-modern-white-desks-2589-1628668840968.jpg", "https://www.viadurini.co.uk/data/prod/img/scrivania-bianca-o-ardesia-in-legno-di-design-italiano-3-misure-michel-2.jpg"],
 ["https://img1.homary.com/filters:format(webp)/mall/file/2021/09/14/784ec5764b45444e97a3eca6de4cc04d.jpg", "https://www.auraadesign.co.uk/wp-content/uploads/2020/09/Futura-%E2%80%93-Modern-Black-Executive-Desk-Main-Image.png", "https://img1.homary.com/mall/file/2022/06/16/99f3c6219833395d55bf9367a32758ec.jpg", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfsmNUN4THH_gJTSmfwA1rq5sR-gIeeug1jtnkluWI-SvvMuKPH9ZOCtf0P8Ejbr5SstE&usqp=CAU", "https://img1.homary.com/filters:format(webp)/mall/file/2022/03/07/ccafe44908064f9eb80245bcfd6d4244.jpg", "https://m.media-amazon.com/images/I/81g1eTHDi5L.jpg", "https://cdn.shopify.com/s/files/1/2268/9819/products/1AGTC_Corner_Computer_Desk_Black_B_2000x.jpg?v=1601382848", "https://i.pinimg.com/originals/47/35/83/4735835364c8aaca31ee5f3be62217ff.jpg", "https://cdn.shopify.com/s/files/1/0529/0026/6166/products/312a9f1dc6ded5d123b996168ca16724_a586a45a-dfb6-4233-9c57-50634d3816fd_1445x.jpg?v=1632761312", "https://www.happybeds.co.uk/media/Beds2020/Enzo_Black_Silver_Desk_Des_1.jpg"],
 ["https://img1.homary.com/filters:format(webp)/mall/file/2022/02/28/3eaec8d398ea47be9e9fb8c636d9de57.jpg", "https://i.etsystatic.com/9171787/r/il/85e6e3/4452369244/il_fullxfull.4452369244_mjzb.jpg", "https://laporta.co.uk/wp-content/uploads/2021/03/ON-WOODS-PAGE1-Ebony-min.jpg", "https://i.etsystatic.com/9171787/r/il/230f4e/3122058918/il_570xN.3122058918_j78d.jpg", "https://i.ytimg.com/vi/RsFGoETBNy4/maxresdefault.jpg", "https://cdn.sklum.com/uk/wk/1225633-988x708/office-table-in-taluk-wood.jpg?cf-resize=imgcat", "https://cdn.sklum.com/uk/wk/1317517-988x708/office-table-in-taluk-wood.jpg?cf-resize=imgcat", "https://projectreclaim.co.uk/wp-content/uploads/Desk-with-Storage-Inbuilt-Drawer-Rugger-Brown-IMG_20210808_170243.jpg", "http://cdn.apartmenttherapy.info/image/upload/v1614381649/gen-workflow/product-database/Lewellyn_Desk-wayfair.jpg", "https://www.denelli.co.uk/media/catalog/product/cache/1/small_image/474x296/9df78eab33525d08d6e5fb8d27136e95/l/o/logo-office-desk-1.jpeg"],
 ["https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1641325843-screen-shot-2022-01-04-at-2-46-05-pm-1641325819.png", "https://glassfurniture.co.uk/wp-content/uploads/2015/08/tonelli-Penrose-Desk.jpg", "https://glassfurniture.co.uk/wp-content/uploads/2016/02/Air-glass-desk-gallotti-and-Radice-8.jpg", "https://www.gomodern.co.uk/var/images/product/1200.863/GM-WORK-01-1-large.jpg", "https://cdn.shopify.com/s/files/1/3004/4124/products/BSD-058_main.jpg?v=1632484806", "https://cdn.rockettstgeorge.co.uk/media/catalog/product/cache/da0750d9711af85067dbdd1214db665f/r/o/rockettstgeorge-glass-desk-dressing-table-with-antique-gold-frame-lores_1.jpg", "https://www.gomodern.co.uk/var/images/product/1200.863/GM-AIR-13-1-large.jpg", "https://www.elegantfurnitureuk.co.uk/pub/media/catalog/product/cache/ae06ab862b247dca02dedd9d28ae7e94/a/m/amalfi-bent-glass-computer-desk-clear.jpg", "https://www.stocktons.co.uk/wp-content/uploads/2015/05/island-glass-desk-by-cattelan-1.jpg", "https://www.thefurnituremarket.co.uk/media/catalog/product/cache/0da5f36988333f78f594c0ac4d9002a6/g/g/gg90-high-1_1__1_2.jpg"]]
 puts("modern desk image array created")
 #first antique wood then metal
 ARRAY_OF_RETRO_DESKS = [["https://i.pinimg.com/736x/19/2a/71/192a71c6554b5b6f7d15d37f859856be.jpg", "https://freeyork.org/wp-content/uploads/2015/02/3b4f764e3a7757ff12d76136c5f42236bd263128c563a90612180311008f9145_-original.jpeg", "https://houseofhipsters.com/wp-content/uploads/2017/08/Vintage-Wooden-Desk-Workspace-2.png", "https://deardesigner.co.uk/wp-content/uploads/2020/01/A-Simple-Vintage-Inspired-Workspace-Get-The-Look-2.jpg", "https://cdn.freeyork.org/wp-content/uploads/2015/02/Vintage-office-for-a-private-residence-Denis-Krasikov-www.homeworlddesign.-com-3.jpg", "http://cdn.home-designing.com/wp-content/uploads/2014/10/stunning-antique-desk.jpeg", "https://i.pinimg.com/736x/7c/58/12/7c58120c0487547c2fec9781b07e4b98--office-set-office-ideas.jpg", "https://i.pinimg.com/736x/d7/a3/9b/d7a39b303c0a2b4e7945f46374138067--antique-desk-dark-interiors.jpg", "https://images.squarespace-cdn.com/content/v1/589896353e00be25e12cb5a0/1523014187373-JB56AF6F64RM7N7K73YV/dark+walls+wooden+desk.jpg", "https://www.polyflor.ca/usercontent/usercontent_Product_Pages//Colonia//Colonia.jpg"],
 ["https://www.tulipinterior.co.uk/media/catalog/product/cache/81dee17ffd7367b8514329e52427d205/image/43701f7a/dark-metal-study-desk-with-unit-small.jpg", "https://www.grahamandgreen.co.uk/media/catalog/product/cache/870f95bf550da40a58875cd923ab880b/c/e/cev1021-sid-black-metal-desk-1.jpg", "https://www.homesdirect365.co.uk/images/retro-metal-desk-p72739-111023_zoom.jpg", "https://cdn.rockettstgeorge.co.uk/media/catalog/product/cache/da0750d9711af85067dbdd1214db665f/r/o/rockettstgeorge-black-metal-bureau-desk-with-3-drawers-lores.jpg", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYFL0FGZ7rN_3vjFHtD-L8GFQF5edkR2GQNyFPUPmZ0AeCCgbXX6ZqtlmdfP5-Ve19cY8&usqp=CAU"]]
 puts("retro desks array created")
#white first then wood
ARRAY_OF_FLOATING_DESKS = [["https://i.etsystatic.com/28327082/r/il/1cd3f4/3920084382/il_fullxfull.3920084382_o9xl.jpg", "https://i.etsystatic.com/18582612/r/il/c7a26d/3254305553/il_fullxfull.3254305553_42ez.jpg", "https://cdn.shopify.com/s/files/1/0921/8478/products/Urbansize_900px_063.jpg?v=1605267485", "https://img1.homary.com/filters:format(webp)/fit-in/600x600/mall/file/2022/12/29/e6ba1613c17153485bf40bc0fb0e0fa1.jpg", "https://www.madebyonandon.com/wp-content/uploads/2020/02/ONON-long-floating-desk-detail.jpg", "https://media.glamourmagazine.co.uk/photos/61d6e5b652d4174c6aab123a/master/w_320%2Cc_limit/FLOATINGDESKS_06012022_Detreville%2520Floating%2520Desk.jpg", "https://cdn.decoist.com/wp-content/uploads/2015/08/Prepac-Studio-Floating-Desk-in-White-with-Yellow-Pattern-Rug.jpg", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhE6BKgXG6NFUMFPpQyFA_yJaAadGqdWkiww&usqp=CAU", "https://visualhunt.com/photos/16/metal-manufactured-wood-floating-desk.jpeg", "https://cdn.shopify.com/s/files/1/0578/4741/4938/products/1_62c9470f-9721-4d91-bef8-7cbdd61204d1.jpg?v=1657043179"],
 ["https://i.pinimg.com/736x/99/9f/28/999f2811e59b1b61f308ffaa997af6c0.jpg", "https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1534959255-71h4sqbtdml-sl1000-1534959244.jpg", "https://i.etsystatic.com/22756767/r/il/4a0efb/3243403449/il_fullxfull.3243403449_a1iq.jpg", "https://media.glamourmagazine.co.uk/photos/61d6e59ddf327c8843206ff4/16:9/w_2580,c_limit/FLOATINGDESKS_06012022_desk%20L.jpg", "https://media.glamourmagazine.co.uk/photos/61d6e5b77204ed6eabf496c5/master/w_320%2Cc_limit/FLOATINGDESKS_06012022_etsy%2520Folding%2520Wall%2520Mounted%2520Table.jpg", "https://i.shelterness.com/2019/12/17-a-floating-shelf-and-a-floating-desk-will-make-up-a-small-yet-comfy-home-office-nook-add-more-light-to-brighten-it-up.jpg", "https://secure.img1-cg.wfcdn.com/im/28449881/compr-r85/1570/157030399/laskowski-floating-desk.jpg", "https://i1.wp.com/withinthegrove.com/wp-content/uploads/2020/06/Playroom-Makeover-with-Ace-Hardware-7-1-scaled.jpg?fit=768%2C1024&ssl=1", "https://i.pinimg.com/originals/e2/39/0b/e2390b45757dc340438eaf49ec02229b.jpg", "http://www.dap.com/media/6352/01_blog-image.jpg"]]

puts("floating desks array created")

name_first = ["Modern black desk", "Modern white desk", "Modern wood desk", "Modern glass desk", "Retro wood desk", "Retro metal desk", "Floating white desk", "Floating wood desk"]
name_second = ["with coffee on tap", "with riverside view", "With garden view", "with free wifi", "with fiber optic wifi", "with comfy sofa", "with city views", "with great natural lighting", "with fast wifi", "with airconditioning", "with underfloor heating"]
addresses = ["1, Papillons Walk", "22, Strode Road", "61-69, Mildmay Street", "Essan House, Victoria Road", "Bywater House, 1-56, Harlinger Street", "10, Tavistock Road", "4, Bladindon Drive", "94, Grand Drive", "102, Ferndale Road", "32, Grove Park Road", "102, Betterton Road", "27, Birch Lane", "Splashy Water Park, Blackthorn Road", "18, Rosehill Gardens", "109, Clifton Hill", "The Chambers, Chelsea Harbour Drive", "280, Old Ford Road", "1, Somaford Grove", "54, Browning Road", "61, Beddington Gardens", "Arkley Golf Club, Sandalwood Close", "39, Queenstown Gardens", "41,41A,43,43A, Bird in Hand Lane", "19, Bardolph Avenue", "The Chambers, Chelsea Harbour Drive", "39, Dawson Avenue", "2, Abbots Close", " NW11 50, 45, Beaufort Drive", "78, Richmond Avenue"]

def test123(x)
  case x
  when "Modern black desk"
    array1 = ARRAY_OF_MODERN_DESKS[0]
  when "Modern white desk"
    array1 = ARRAY_OF_MODERN_DESKS[1]
  when "Modern wood desk"
    array1 = ARRAY_OF_MODERN_DESKS[2]
  when "Modern glass desk"
    array1 = ARRAY_OF_MODERN_DESKS[3]
  when "Retro wood desk"
    array1 = ARRAY_OF_RETRO_DESKS[0]
  when "Retro metal desk"
    array1 = ARRAY_OF_RETRO_DESKS[1]
  when "Floating white desk"
    array1 = ARRAY_OF_FLOATING_DESKS[0]
  when "Floating wood desk"
    array1 = ARRAY_OF_FLOATING_DESKS[1]
  end
  return array1
end

angus = User.create(
  first_name: 'angus',
  last_name: 'test',
  email: 'test@test.com',
  password: '123456'
)

puts("angus user created")

(0..9).each do |count|
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name ,
    email: "test#{count}@test.com",
    password: '123456'
  )
  puts("user#{count} created")
  (0..2).each do |count2|
    first_name = name_first.sample
    full_name = "#{first_name} #{name_second.sample}"

    workspace = Workspace.new(
      name: first_name,
      price: rand(15..40),
      address: "#{addresses.sample}",
      description: "#{full_name}",
      booking_status: true
    )
    workspace.user = user
    (0..2).each do |count3|
      file = URI.open("#{test123(workspace.name).sample}")
      puts file
      workspace.photos.attach(io: file, filename: "desk.png", content_type: "image/png")
    end
    workspace.name = full_name
    workspace.save!
  end
end



# tom_workspace = Workspace.new(
#   name: "Tom's desk",
#   price: rand(15..40),
#   address: "146 Clapham High St, London SW4 7UH",
#   description: 'lovely desk put up for rent by tom',
#   booking_status: true
# )
# tom_workspace.user = tom

# file = URI.open("https://secure.img1-cg.wfcdn.com/im/75644953/resize-h600-w600%5Ecompr-r85/2020/202041306/Mayne+Home+Office+Computer+Desk.jpg")
# tom_workspace.photos.attach(io: file, filename: "desk1.png", content_type: "image/png")
# tom_workspace.save

# angus_workspace = Workspace.new(
#   name: "Angus' desk",
#   price: rand(15..40),
#   address: "14 Bohemia Pl, London E8 1DU",
#   description: 'lovely desk put up for rent by angus',
#   booking_status: true
# )
# angus_workspace.user = angus
# file = URI.open("https://secure.img1-cg.wfcdn.com/im/06506657/resize-h310-w310%5Ecompr-r85/2218/221857133/charleena-computer-desk.jpg")
# angus_workspace.photos.attach(io: file, filename: "desk2.png", content_type: "image/png")
# angus_workspace.save

# matt_workspace = Workspace.new(
#   name: "Matt's desk",
#   price: rand(15..40),
#   address: "16-19 Upper St Martin's Ln, London WC2H 9EF",
#   description: 'lovely desk put up for rent by matt',
#   booking_status: true
# )
# matt_workspace.user = matt
# file = URI.open("https://m.media-amazon.com/images/I/71k6ifp-15L._AC_SL1500_.jpg")
# matt_workspace.photos.attach(io: file, filename: "desk3.png", content_type: "image/png")
# matt_workspace.save

# sam_workspace = Workspace.new(
#   name: "Sam's desk",
#   price: rand(15..40),
#   address: " Arundel House, 4 Palace Green, Londra, W8 4QD",
#   description: 'lovely desk put up for rent by sam',
#   booking_status: true
# )
# sam_workspace.user = sam
# file = URI.open("https://cdn.shopify.com/s/files/1/2268/9819/products/MD019-White-1-AGTC_Computer_Desk_White_A_3744x.jpg?v=1619537177")
# sam_workspace.photos.attach(io: file, filename: "desk4.png", content_type: "image/png")
# sam_workspace.save

# puts("workspaces created")

# tom_booking = Booking.new(
#   start_date: DateTime.strptime("01/03/2023", "%d/%m/%Y"),
#   end_date: DateTime.strptime("02/03/2023", "%d/%m/%Y"),
# )
# tom_booking.user = tom
# tom_booking.workspace = angus_workspace
# tom_booking.save

# puts("test1")

# angus_booking = Booking.new(
#   start_date: DateTime.strptime("01/04/2023", "%d/%m/%Y"),
#   end_date: DateTime.strptime("02/04/2023", "%d/%m/%Y"),
# )
# angus_booking.user = angus
# angus_booking.workspace = matt_workspace
# angus_booking.save

# puts('test2')

# matt_booking = Booking.new(
#   start_date: DateTime.strptime("01/05/2023", "%d/%m/%Y"),
#   end_date: DateTime.strptime("02/05/2023", "%d/%m/%Y"),
# )
# matt_booking.user = matt
# matt_booking.workspace = sam_workspace
# matt_booking.save

# puts('test3')

# sam_booking = Booking.new(
#   start_date: DateTime.strptime("01/06/2023", "%d/%m/%Y"),
#   end_date: DateTime.strptime("02/06/2023", "%d/%m/%Y"),
# )
# sam_booking.user = sam
# sam_booking.workspace = tom_workspace
# sam_booking.save

# puts('test4')




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
