require_relative 'nameable'
class Person < Nameable
  attr_reader :rentals, :id
  attr_accessor :name, :age

  def initialize(age, name = 'unkown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @parent_permission = parent_permission
    @age = age
    @rentals = []
  end

  def add_rental(date, person)
    Rental.new(date, person, self)
  end

  def correct_name
    @name
  end

  def create_object
    object_data = { age: @age, name: @name, id: @id }
    @object_data = object_data
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    @is_of_age || @parent_permission
    true
  end
  # private :is_of_age
end
