require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'

puts "Exercise 5"
puts "----------"

puts "Total Revenue: #{Store.sum(:annual_revenue)}"
puts "Average Annual Revenue: #{Store.sum(:annual_revenue)/Store.count()}"
puts "Number of Stores with +$1M Annual Sales: #{Store.where('annual_revenue > 1000000').count}"