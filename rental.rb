require_relative './book'
require_relative './person'
class Rental
  attr_accessor :date, :book, :person

  def initialize(book, person, date)
    @date = date
    @book = book
    book.rentals << self

    @person = person
    person.rentals << self
  end

  def create_object
    { book_title: @book.title, person_id: @person, date: @date }
  end
end
