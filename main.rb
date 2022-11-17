# require './person.rb'
# require './student.rb'
# require './classroom.rb'
# require './rental.rb'
# require './book.rb'

# # Testing has many/Belong to of classroom and student
# student1 = Student.new('Joseph')
# student2 = Student.new('Moses')
# classroom1 = Classroom.new('217')

# classroom1.add_student(student1)
# classroom1.add_student(student2)

# p classroom1.students.map { |student| student.name }

# student3 = Student.new('Jobilian')
# student4 = Student.new('Damaris')
# classroom2 = Classroom.new('506')

# student3.classroom = classroom2;
# student4.classroom = classroom2;
# p classroom2.students.map { |student| student.name }

# # Testing many to many of person book and rental.

# person1 = Person.new(23, 'Drogo')
# person2 = Person.new(23, 'Julaina')

# book1 = Book.new('River Between', 'Ngugi Wa Thiongo')
# book2 = Book.new('Utengano', 'Petro')

# rental1 = Rental.new('2017-12-22', book1, person1)
# rental2 = Rental.new('2018-12-22', book2, person2)
# rental3 = Rental.new('2016-12-22', book1, person1)
# rental4 = Rental.new('2019-12-22', book2, person1)

# p person1.rentals.count
# # p person1.rentals.map { |rent| rent.date }
# p book1.rentals.count
# p book2.rentals.count
# p book1.rentals.map { |rent| rent.date }
