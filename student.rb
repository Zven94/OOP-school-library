# creating a Person subclass: student
class Student < Person
  # define getter&setter for @name and @classroom
  attr_accessor :name, :classroom

  # Initializes a Student object with the given classroom
  def initialize(age, _classroom, name = 'Unknown', parent_permission: true)
    super(name, age, parent_permission)
    @classroom = nil
  end

  def play_hooky
    '"¯\\(ツ)/¯"'
  end
end
