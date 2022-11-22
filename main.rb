
require './app'
def main
  app = App.new
  app.start_console
end

def list_of_options
puts 'Choose an option below to proceed:'
puts '1 - List all books'
puts '2 - List people'
puts '3 - Create a person'
puts '4 - Create a book'
puts '5 - Create a rental'
puts '6 - List all rentals '
puts '7 - List of books rented by a student '
puts '8 - Exit'
end

def option(input)
case input
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
else
    puts 'Please enter a number between 1 and 8.'
end

end

main

