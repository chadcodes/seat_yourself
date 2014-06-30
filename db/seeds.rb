# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# users = []
# 10.times do
#   f_names = %w(Carter Luke Jackson Max Chloe Leah Sarah Nora)
#   l_names = %w(Heaney Struhl Cannell Goode Grayson Rushmore Soper Ruben)
#   name = f_names[(rand(0..7))] + " " + l_names[(rand(0..7))]
#   email = "a@b.com"
#   password = BCrypt::Password.create('123')
#   notes = "Lorem ipsum dolor sit amet."

#   new_user = [name, email, password, notes]
#   users.push(new_user)
# end

# users.each do |name, email, password, notes|
#   User.create( :name => name,
#     :email => email,
#     :password_digest => password,
#     :notes => notes )
# end



# # create some restaurants
# restaurants = []
# i = 0
# 8.times do
#   r_name = ["Ponderosa", "Pizza Delight", "Boston Pizza", "Captain Johns", "St. Huberts", "Swiss Chalet", "Xola", "Beach Tree"]
#   menu = "stuff"
#   seats = 50
#   street_address = "54 Main St."
#   postal_code = "M1M 1M1"
#   photo_url = "http://placehold.it/250/250"
#   price_range = rand(1..4)
#   cuisine = ["Canadian", "Pizza", "Italian", "Seafood", "Chicken", "Rotisserie", "Mexican", "British"]
#   new_restaurant = [r_name[i], menu, seats, street_address, postal_code, photo_url, price_range, cuisine[i]]
#   restaurants.push(new_restaurant)
#   i += 1
# end

# create some restaurants
# restaurants = []
# i = 0
# 8.times do
#   r_name = ["Ponderosa", "Pizza Delight", "Boston Pizza", "Captain Johns", "St. Huberts", "Swiss Chalet", "Xola", "Beach Tree"]
#   menu = "stuff"
#   seats = 50
#   street_address = "54 Main St."
#   postal_code = "M1M 1M1"
#    photo_url = "http://lorempixel.com/450/450/food/" + rand(1..9).to_s + "/"
#   price_range = rand(1..4)
#   cuisine = ["Canadian", "Pizza", "Italian", "Seafood", "Chicken", "Rotisserie", "Mexican", "British"]
#   new_restaurant = [r_name[i], menu, seats, street_address, postal_code, photo_url, price_range, cuisine[i]]
#   restaurants.push(new_restaurant)
#   i += 1
# end


# restaurants.each do |name, menu, seats, street_address, postal_code, photo_url, price_range, cuisine|
#   Restaurant.create(
#     :restaurant_name => name,
#     :menu => menu,
#     :seats => seats,
#     :street_address => street_address,
#     :postal_code => postal_code,
#     :photo_url => photo_url,
#     :price_range => price_range,
#     :cuisine => cuisine )
# end


# create some random reservations
reservations = []
300.times do
  restaurant_id = rand(9..30)
  user_id = rand(1..10)
  guests = rand(1..4)
  date = DateTime.now.strftime("%Y-%m-%d "+rand(11..20).to_s)
  new_reservation = [restaurant_id, user_id, guests, date]
  reservations.push(new_reservation)
end

reservations.each do |restaurant_id, user_id, guests, date|
  Reservation.create(
    :restaurant_id => restaurant_id,
    :user_id => user_id,
    :guests => guests,
    :date => date)
end
