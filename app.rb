require_relative './person'
require './student'
require './teacher'
require './classroom'
require './book'
require './rental'
require_relative './store'
require 'json'

class App
  attr_reader :people, :rentals, :books

  def initialize
    @people_info = Store.new('person')
    @rentals_info = Store.new('rental')
    @books_info = Store.new('books')
    @books = @books_info.read.map{|arr| Book.new(arr['title'],arr['author'])}
    @people=@people_info.read.map do |arr|
      if arr['class'].include?('Student')
        Student.new(arr['age'],arr['name'],arr['parent_permission'],arr['classroom'])
        else
          Teacher.new(arr['age'],arr['name'],arr['specialization'])
      end
    end
    @rentals = @rentals_info.read.map do |arr|
      book = @books.select { |bk| bk.title == arr['book_title'] }[0]
      person = @people.select { |pers| pers.id == arr['person_id'] }[0]
      Rental.new(book, person, arr['date'])
    end
  end

  def start_console
    puts '*****Welcome to Taas school Library!*****'
    until list_of_options
      input = gets.chomp
      if input == '8'
        exit
        puts 'Thank You for using my School Library!'
        break
      end
      option input
    end
  end

  # Create a book.
  def create_book
    print 'Enter Title: '
    title = gets.chomp

    print 'Enter Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts "#{title} by #{author}  was successfully added"
  end

  # List books
  def list_books
    @books_info =  @books.map { |book| puts "Book Title: #{book.title}, Author name: #{book.author}" }
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

  def permission?
    print 'Has parent permission? [Y/N]:'
    permission = gets.chomp

    case permission.downcase
    when 'y'
      true
    when 'n'
      false
    else
      puts 'Invalid input'
      permission?
    end
  end

  def create_student
    puts 'Enter the Name'
    name = gets.chomp
    puts 'Enter the age'
    age = gets.chomp.to_i
    parent_permission = permission?
    @people << Student.new(age, name, parent_permission)
    puts "#{name}  aged #{age}  was successfully added"
  end

  def create_teacher
    puts 'Enter the Name'
    name = gets.chomp
    puts 'Enter the age'
    age = gets.chomp.to_i
    puts 'Enter the specialization'
    specialization = gets.chomp
    @people << Teacher.new(age, name, specialization)
    puts "#{name}  aged #{age}  was successfully added"
  end

  def list_people
    @people.map { |person| puts "Person name: #{person.name}, age: #{person.age}" }
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
  end

  def list_rentals
    @rentals.each { |rental| puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}" }
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
  end
  def exit
    @books_info.write(@books.map(&:create_object))
    @people_info.write(@people.map(&:create_object))
    @rentals_info.write(@rentals.map(&:create_object))
  end

end
