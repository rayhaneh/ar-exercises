require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

puts "Please provide a name for your store:"
store_name = gets.chomp

new_store = Store.new(name: store_name)

puts "*****************************************"
if (!new_store.valid?)
  new_store.errors.messages.each do |key, value|
    puts "#{key}: #{value[0]}"
  end
else
  new_store.save
end
puts "*****************************************"