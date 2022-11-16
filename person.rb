class Person
  def initialize(age, name = 'unkown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @parent_permission = parent_permission
    @age = age
  end

  attr_accessor :name
  attr_accessor :age

  attr_reader :id

  def of_age
    if @age >= 18
      return true
    end
  end

  def can_use_services
    if @is_of_age || @parent_permission
      return true
    end
  end
  private :is_of_age
end
