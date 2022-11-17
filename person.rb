require_relative 'nameable'
class Person < Nameable
  def initialize(age, name = 'unkown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @parent_permission = parent_permission
    @age = age
  end

  attr_accessor :name, :age
  attr_reader :id
  def correct_name
    @name
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
