# define Rental class
class Rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book

    person.rentals << self if person.respond_to?(:rentals)
    book.rentals << self if book.respond_to?(:rentals)
  end
end
