require './person'
require './student'
require './teacher'
require './classroom'
require './book'
require './rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  # User interaction point UI.
  def ui
    puts '*****Welcome to Taas school Libary!*****'

    puts 'Choose an option below to proceed:'
    puts '1 - List all books'
    puts '2 - List people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals '
    puts '7 - List of books rented by a student '
    puts '8 - Exit'

    options
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def options
    option = gets.chomp
    case option
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rentals
    when '7'
      list_student_books
    when '8'
      puts 'Thank you for using this app!'
      exit 0
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity

  # Create and get a book
  def create_book
    print 'Enter Title: '
    title = gets.chomp

    print 'Enter Author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts "#{title} by #{author}  was successfully added"
    ui
  end

  def list_books
    @books.map { |book| puts "Book Title: #{book.title}, Author name: #{book.author}" }
    ui
  end

  # Create and list person.
  def create_person
    print 'Enter 1 to create a student and 2 to create a teacher: '
    person_type = gets.chomp
    case person_type
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'That is not a valid input'
    end
  end

  def create_student
    puts 'Enter the Name'
    name = gets.chomp
    puts 'Enter the age'
    age = gets.chomp
    @people << Student.new(age, name)
    puts "{#name}  aged #{age}  was successfully added"
    ui
  end

  def create_teacher
    puts 'Enter the Name'
    name = gets.chomp
    puts 'Enter the age'
    age = gets.chomp
    puts 'Enter the specialization'
    specialization = gets.chomp
    @people << Teacher.new(age, name, specialization)
    puts "#{name}  aged #{age}  was successfully added"
    ui
  end

  def list_people
    @people.map { |person| puts "Person name: #{person.name}, age: #{person.age}" }
    ui
  end

  # Create and list rentals
  def create_rental
    puts 'Select a book'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    book_index = gets.chomp
    puts 'Select a student from the list below'
    @people.each_with_index do |student, index|
      puts "#{index}) Name: #{student.name}, Age: #{student.age}"
    end
    person_index = gets.chomp
    print 'Date: '
    date = gets.chomp
    @rentals << Rental.new(date, @books[book_index.to_i], @people[person_index.to_i])
    puts 'Rental Added'
    ui
  end

  def list_rentals
    @rentals.each { |rental| puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}" }
    ui
  end

  def list_student_books
    print 'Name of a student: '
    name = gets.chomp
    puts 'Books Rented: '
    @rentals.each do |rental|
      if rental.person.name == name
        puts "Date: #{rental.date}, Book: #{rental.book.title}"
      else
        puts "No Books rented by: #{name}"
      end
    end
    ui
  end
end
