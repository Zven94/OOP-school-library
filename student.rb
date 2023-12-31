# creating a Person subclass: student
class Student < Person
  # define getter&setter for @name and @classroom
  attr_accessor :name
  attr_reader :classroom

  # Initializes a Student object with the given classroom
  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    # ask if classroom already have the student, otherwise it includ it
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '"¯\\(ツ)/¯"'
  end
end
