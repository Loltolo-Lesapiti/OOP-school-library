class Rental
  attr_reader :book, :person
  attr_accessor :date

  def initialize(date, book, person)
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
