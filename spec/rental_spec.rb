require_relative '../book'
require_relative '../student'
require_relative '../rental'

describe Rental do
    context 'Unit test for Rental Class' do
      book = Book.new('The River Between', 'Ngugi Wa Thiongo')
      person = Student.new(24, 'Kidde', parent_permission: true)
      rental = Rental.new(book, person,'25/11/2022')
  
      it 'If it is a book' do
        expect(rental.book).to eql(book)
      end
  
      it 'If the book title is correct' do
        expect(rental.book.title) == 'The River Between'
      end
  
      it 'If the book author is correct' do
        expect(rental.book.author) == 'Ngugi Wa Thiongo'
      end
  
      it 'If it is a student' do
        expect(rental.person).to eql(person)
      end
  
      it 'If the student name is correct' do
        expect(rental.person.name) == 'Kidde'
      end
  
      it 'If it creates a new instance of Rental' do
        expect(rental).to be_an_instance_of(Rental)
      end
    end
  end