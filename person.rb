# frozen_string_literal: true

# creating a Person class
class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = rand(1000..9999)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  # define getter for @name
  attr_accessor :name

  # define setter for @name

  # define getter for @age
  attr_accessor :age

  # define getter for age

  def can_use_services?
    if (age >= 18) || @parent_permission
      true
    else
      false
    end
  end

  # private method section
  private

  def of_age?
    return true if @age >= 18

    false
  end
end

Person.new(26, 'Nico', true)
