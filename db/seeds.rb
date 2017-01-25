# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Creating bubble gum..."
Product.create(
  name: "Bubble gum",
  unit_price: 200,
  warehouse_quantity: 100000,
  store_quantity: 1000,
  expiration: nil
)
puts "Creating KitKat..."
Product.create(
  name: "KitKat",
  unit_price: 300,
  warehouse_quantity: 100000,
  store_quantity: 1000,
  expiration: Time.now + (5 * 365 * 24 * 60 * 60)
)
puts "Creating Snickers..."
Product.create(
  name: "Snickers",
  unit_price: 300,
  warehouse_quantity: 100000,
  store_quantity: 1000,
  expiration: Time.now + (5 * 365 * 24 * 60 * 60)
)
puts "Creating Marbles..."
Product.create(
  name: "Marbles",
  unit_price: 500,
  warehouse_quantity: 10000,
  store_quantity: 100,
  expiration: nil
)
puts "Creating Twizzlers..."
Product.create(
  name: "Twizzlers",
  unit_price: 300,
  warehouse_quantity: 100000,
  store_quantity: 1000,
  expiration: Time.now + (10 * 365 * 24 * 60 * 60)
)
