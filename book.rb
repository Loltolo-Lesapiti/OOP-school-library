class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end
  
  def create_object
    { title: @title, author: @author }
  end
end
