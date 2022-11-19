require './person'
require './student'
require './teacher'
require './classroom'
require './book'
require './rental'

class App
  def initialize
    @books = []
    @students = []
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

    # rubocop:disable Metrics/CyclomaticComplexity
    options
    # rubocop:enable Metrics/CyclomaticComplexity
  end

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

  # Create and get a book
  def create_book
    print 'Enter Title: '
    title = gets.chomp

    print 'Enter Author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts title + ' by ' + author + ' was successfully added'
    ui
  end

  def list_books
    @books.map { |book| puts "Book Title: #{book.title}, Author name: #{book.author}" }
    ui
  end

  # Create and list person.
  def create_person
    puts 'Enter the Name'
    name = gets.chomp
    puts 'Enter the age'
    age = gets.chomp
    @students << Student.new(age, name)
    puts name + ' aged ' + age + ' was successfully added'
    ui
  end

  def list_people
    @students.map { |student| puts 'Student name: #{student.name}, age: #{student.age}' }
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
    @students.each_with_index do |student, index|
      puts "#{index}) Name: #{student.name}, Age: #{student.age}"
    end
    person_index = gets.chomp
    print 'Date: '
    date = gets.chomp
    @rentals << Rental.new(date, @books[book_index.to_i], @students[person_index.to_i])
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
        puts 'No Books rented by ' + name
      end
    end
    ui
  end
end
