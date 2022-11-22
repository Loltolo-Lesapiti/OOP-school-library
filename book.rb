class Book
  attr_accessor :title, :author
  attr_reader :rentals, :books

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
    @books=[]
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end
end

class ManageBook
  attr_accessor :books
  def initialize()
    @books=[]
  end
  # Create a book.
  def create_book
    print 'Enter Title: '
    title = gets.chomp

    print 'Enter Author: '
    author = gets.chomp
    @books.push(Book.new(title, author))
    puts "#{title} by #{author}  was successfully added"
  end

  #List books
  def list_books
    @books.map { |book| puts "Book Title: #{book.title}, Author name: #{book.author}" }
  end
end
