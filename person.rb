# create a Nameable class
class Nameable
  def correct_name
    raise NotImplementedError
  end
end

# creating a Person class
class Person < Nameable
  # define getter&setter for @name & @age
  attr_accessor :name, :age, :rental

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = rand(1000..9999)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  def correct_name
    @name
  end

  add_rental(book, date)
  rental = Rental.new(self, book, date)
  @rental << rental
end

def can_use_services?
  if of_age? || @parent_permission
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

class Decorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    original_name = @nameable.correct_name
    original_name.length > 10 ? original_name[0..9] : original_name
  end
end
