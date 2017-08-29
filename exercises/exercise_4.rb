require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'

puts "Exercise 4"
puts "----------"

Store.create(name: 'Surrey',   annual_revenue: 224000,  mens_apparel: false,  womens_apparel: true)
Store.create(name: 'Whistler', annual_revenue: 1900000, mens_apparel: true, womens_apparel: false)
Store.create(name: 'Yaletown', annual_revenue: 430000,  mens_apparel: true,  womens_apparel: true)

@mens_stores = Store.where(mens_apparel: true)

puts "----- Men's Stores-----"
@mens_stores.each do |mens_store|
  puts "Store Name: #{mens_store[:name]}, Annual Revenue: #{mens_store[:annual_revenue]}"
end

puts "-----Women's Stores-----"
@womens_stores = Store.where(womens_apparel: true).where('annual_revenue > 1000000')
@womens_stores.each do |womens_store|
  puts "Store Name: #{womens_store[:name]}, Annual Revenue: #{womens_store[:annual_revenue]}"
end