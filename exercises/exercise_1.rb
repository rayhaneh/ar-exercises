require_relative '../setup'

puts "Exercise 1"
puts "----------"

class Store < ActiveRecord::Base
  has_many  :employees
  validates :name, length: { minimum: 3 }
  validates_numericality_of :annual_revenue, presence: true, :only_integer => true, :greater_than_or_equal_to => 0
  validate  :must_carry_mens_or_womens_apparel

  def must_carry_mens_or_womens_apparel
    errors.add(:base, "Store must carry either women's or men's apparel.") if (!mens_apparel && !womens_apparel)
  end
end

# Create the First Store
Store.create(name: 'Burnaby', annual_revenue: 300000, mens_apparel: true, womens_apparel: true)
Store.create(name: 'Richmond', annual_revenue: 1260000, mens_apparel: false, womens_apparel: true)
Store.create(name: 'Gastown', annual_revenue: 190000, mens_apparel: true, womens_apparel: false)

# Print the Number of Store in the Database
puts "----------"
puts "Number of Store: #{Store.count}"
puts "----------"