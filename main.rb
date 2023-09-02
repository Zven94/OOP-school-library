# frozen_string_literal: true

require_relative 'app'

class Main
  def initialize
    @app = App.new
  end

  def menu
    puts 'Please choose an option by entering a number: '
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person(student or teacher)'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def main
    puts 'Welcome to OOP School Library Application!'
    puts

    options = %i[list_all_books list_all_persons create_a_person create_a_book create_a_rental list_rental_person]

    loop do
      menu
      option = gets.chomp.to_i
      break if option == 7

      if option.to_i.positive? && option.to_i < 7
        @app.send(options[option.to_i - 1])
      else
        puts 'Option unknown'
      end
    end
    puts 'We appreciate your use of this app!'
    puts 'for queries or errors use the following link:'
    puts '- https://github.com/Zven94/OOP-school-library/issues'
  end
end

Main.new.main
