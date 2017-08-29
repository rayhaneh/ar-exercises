require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'
require_relative './exercise_7'
require_relative './exercise_8'


# Make sure non-empty stores cannot be destroyed
@store1 = Store.find(1)
if !@store1.destroy
  @store1.errors.messages.each do |key, value|
    puts "#{key}: #{value[0]}"
  end
end
puts "Number of employees: #{@store1.employees.count}"

# Make sure empty stores can be destroyed
@empty_store = Store.create!(name: 'Test Empty Store', annual_revenue: 0, mens_apparel: true)
if !@empty_store.destroy
  @empty_store.errors.messages.each do |key, value|
    puts "#{key}: #{value[0]}"
  end
end
puts "Number of employees: #{@empty_store.employees.count}"