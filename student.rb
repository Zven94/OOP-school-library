require_relative 'person'

# creating a Person subclass: student
class Student < Person
  # Initializes a Student object with the given classroom
  def initialize(classroom = 'Unknown', name = 'Unknown', age = 0, parent_permission: true)
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    ""¯\(ツ)/¯""
  end
end
