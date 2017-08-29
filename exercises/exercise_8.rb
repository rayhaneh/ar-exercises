require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'
require_relative './exercise_7'


@store4.employees.create(first_name: "Jim", last_name: "Jim", hourly_rate: 40)
puts "*****************************************"
puts "The new employee's password is: #{Employee.last[:password]}"
puts "*****************************************"
