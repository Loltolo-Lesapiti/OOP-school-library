require_relative 'person'
class Student < Person
  attr_reader :classroom
  def initialize(age, name, parent_permission, classroom = [])

    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
  def create_object
    super()
    object_data = @object_data
    object_data[:classroom] = @classroom
    object_data[:class] = 'Student'
    object_data[:parent_permission] = @parent_permission
    object_data
  end
end
