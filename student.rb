# creating a Person subclass: student
class Student < Person
  # define getter&setter for @name and @classroom
  attr_accessor :name
  attr_reader :classroom

  # Initializes a Student object with the given classroom
  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(name, age, parent_permission)
    self.classroom = classroom
  end
  
  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self) # ask if classroom already have the student, otherwise it includ it
  end

  def play_hooky
    '"¯\\(ツ)/¯"'
  end
end
