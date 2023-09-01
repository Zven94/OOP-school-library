require_relative 'person'
require_relative 'classroom'
require_relative 'student'
require_relative 'book'
require_relative 'rental'
require_relative 'teacher'

class App 
  def initialize
    @person = []
    @book = []
    @rental = []
  end

  def list_books
    @book
  end

  def list_persons
    @person
  end

  # create teacher

  def create_teacher(name, age, specialization)
    @person << Teacher.new(name, age, specialization, parent_permission: true)
  end

  # create student

  def create_student(name, age, parent_permission)
    @person << Student.new(age, nil, name, parent_permission: true)
  end

  # create book

  def create_book(title, author)
    @book << Book.new(title, author)
  end

  # create rental for book

  def create_rental(date, person, book)
    @rental << Rental.new(date, person, book)
  end

  def list_rentals(id)
    @person.each do |p|
      return p.rental if p.id == id
    end
  end
end
