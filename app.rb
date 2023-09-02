# frozen_string_literal: true

require_relative 'person'
require_relative 'classroom'
require_relative 'student'
require_relative 'book'
require_relative 'rental'
require_relative 'teacher'

class App
  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def list_all_books
    if @books.empty?
      puts "\nNo books yet"
    else
      puts "\nBooks:"
      @books.each_with_index { |book, index| puts "#{index}: #{book.title} by #{book.author}" }
    end
  end

  def list_all_persons
    if @persons.empty?
      puts "\nNo people yet"
    else
      @persons.each_with_index do |person, index|
        puts "#{index}: [#{person.class}] name: #{person.name} ID: #{person.id} Age: #{person.age}"
      end
    end
  end

  def create_a_person
    loop do
      print 'Would you like to create a student (1) or a teacher (2)? [Please enter the corresponding number]:'
      option = gets.chomp.strip.to_i

      case option
      when 1
        create_a_student
        break
      when 2
        create_a_teacher
        break
      else
        puts 'Option unknown'
      end
    end
  end

  def create_a_teacher
    print 'Name: '
    age = gets.chomp.to_i
    print 'Age: '
    name = gets.chomp
    print 'Specialisation: '
    specialization = gets.chomp
    puts 'Teacher created successfully '
    @persons.push(Teacher.new(name, age, specialization, parent_permission: true))
  end

  def create_a_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Classroom: '
    classroom = gets.chomp
    Classroom.new(classroom)
    print 'Has parents permission ? [y/n]: '
    parent_permission = gets.chomp.downcase == 'y'
    puts 'Student created successfully '
    @persons.push(Student.new(age, classroom, name, parent_permission: parent_permission))
  end

  def create_a_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    puts 'Book created successfully'
    @books.push(Book.new(title, author))
  end

  def create_a_rental
    puts 'Choose a book from the list below by entering the corresponding number:'
    list_all_books
    book = gets.chomp.to_i
    puts 'Choose a person from the following list by number(not id)'
    list_all_persons
    person = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    puts 'Rental created successfully'
    @rentals << Rental.new(date, @books[book], @persons[person])
  end

  def list_rental_person
    print 'ID of person: '
    list_all_persons
    gets.chomp.to_i
    puts 'Rentals: '
    @rentals.each do |rental|
      puts "Date: \"#{rental.date}\", Book: #{rental.person.title} by #{rental.person.author}"
    end
  end

  def valid_input?(input, max_value)
    input.to_i >= 0 && input.to_i < max_value
  end
end
