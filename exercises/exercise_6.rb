require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

class Employee < ActiveRecord::Base
  belongs_to :store
  validates  :first_name, presence: true
  validates  :last_name,  presence: true
  validates  :store_id,   presence: true
  validates_numericality_of :hourly_rate, :greater_than_or_equal_to => 40, :less_than_or_equal_to => 100, :message => "Invalid Hourly Rate"

  before_create :generate_password_before_create
  after_create  :generate_password_after_create
  # before_save :generate_password_before_save


  private

  def generate_password_before_create
    self.password = (0...8).map { (65 + rand(26)).chr }.join
  end

  def generate_password_after_create
    self.password = (0...8).map { (65 + rand(26)).chr }.join
    self.save
  end

  def generate_password_before_save #will be called everytime we are saving employee
    self.password = (0...8).map { (65 + rand(26)).chr }.join
  end

end

@store4 = Store.find(4)

@store1.employees.create(first_name: "Khurram", last_name: "Virani",      hourly_rate: 60)
@store1.employees.create(first_name: "John",    last_name: "Smith",       hourly_rate: 43)
@store2.employees.create(first_name: "Alice",   last_name: "Wonderland",  hourly_rate: 30)
@store2.employees.create(first_name: "Bob",     last_name: "Anderson",    hourly_rate: 55)
@store2.employees.create(first_name: "Andrew",  last_name: "Ophelia",     hourly_rate: 45)
@store2.employees.create(first_name: "Nadia",   last_name: "Tinatin",     hourly_rate: 45)




#### NOTES: ####
# Object life cycle in create operation:
# 1) before validation
# 2) before validation on create
# 3) after validation
# 4) after valildation on create
# 5) before save (will be triggerd everytime an object is saved)
# 6) before create (will be triggerd only the first time an object is created)
# ==> DATABASE INSERT
# 7) after create (will be triggerd everytime an object is saved)
# 8) after save (will be triggerd everytime an object is created)
























