require_relative 'app'

class Main
  ()
  def initialize
    @app = App.new
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialisation: '
    specialisation = gets.chomp
    puts 'Teacher created successfully '
    puts
    @app.create_teacher(age, specialisation, name)
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parents permission ? [y/n]: '
    permission = gets.chomp
    puts 'Student created successfully '
    puts
    @app.create_student(name, age, permission)
  end

  def create_person
    loop do
      print 'Pleas choose an option: '
      print ' -(1) to create a student.'
      print ' -(2) to create a teacher.'
      print '[Please enter the corresponding number]: '
      option = gets.chomp

      case option
      when '1'
        create_student
        break
      when '2'
        create_teacher
        break
      else
        puts 'Option unknown'
      end
    end
  end

  def create_book
    print 'Book Title: '
    title = gets.chomp
    print 'Book Author: '
    author = gets.chomp
    @app.create_book(title, author)
    puts 'Great! Book created successfully'
    puts
  end

  def create_rental
    puts 'Choose a book below by entering the corresponding number:'
    list_books(with_id: true)
    book = gets.chomp
    puts 'Choose a person from the following list by number the corresponding'
    list_persons(with_id: true)
    person = gets.chomp
    print 'Date: '
    date = gets.chomp
    puts 'Great! Rental created successfully'
    puts
    @app.create_rental(date, book.to_i, person.to_i)
  end

  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals: '
    rentals = @app.list_rentals(id.to_i)
    rentals&.each do |rental|
      puts "Date: \"#{rental.date}\", Book: #{rental.person.title} by #{rental.person.author}"
    end
    puts
  end

  def menu
    puts 'Please choose an option by entering a number: '
    puts '1 - List books'
    puts '2 - List users'
    puts '3 - Create a (student or teacher)'
    puts '4 - Create a new book'
    puts '5 - Create a new rental'
    puts '6 - List all rentals for a given user id'
    puts '7 - Exit'
  end

  def list_books(with_id: false)
    if with_id
      @app.list_books.each.with_index(0) do |book, idx|
        puts "#{idx}) Title: \"#{book.title}\", Author: #{book.author}"
      end
    else
      @app.list_books.each do |book|
        puts "Title: \"#{book.title}\", Author: #{book.author}"
      end
    end
    puts
  end

  def list_persons(with_id: false)
    if with_id
      @app.list_persons.each.with_index(0) do |person, idx|
        puts "#{idx}) [#{person.class}] Name: \"#{person.name}\", ID: #{person.id}, Age: #{person.age}"
      end
    else
      @app.list_persons.each do |person|
        puts "[#{person.class}] Name: \"#{person.name}\", ID: #{person.id}, Age: #{person.age}"
      end
    end
    puts
  end

  def main
    puts 'Welcome to School Library Application!'
    puts

    options = %i[list_books list_persons create_person create_book create_rental list_rentals]

    loop do
      menu
      option = gets.chomp
      break if option == '7'

      if option.to_i.positive? && option.to_i < 7
        send(options[option.to_i - 1])
      else
        puts 'Option unknown'
      end
    end
    puts 'We appreciate your use of this app!'
    puts 'for queries or errors use the following link:'
    print '- https://github.com/Zven94/OOP-school-library/issues'
  end
end

Main.new.main
