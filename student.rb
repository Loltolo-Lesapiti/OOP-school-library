require_relative 'person'
class Student < Person
  def initialize(classroom)
    super(age, name)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
