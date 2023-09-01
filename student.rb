# creating a Person subclass: student
class Student < Person
  # define getter&setter for @name and @classroom
  attr_accessor :name
  attr_reader :classroom

  # Initializes a Student object with the given classroom
  def initialize(age, classroom = nil, name = 'Unknown', parent_permission: true)
    super(name, age, parent_permission: parent_permission)
    self.classroom = classroom if classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    # ask if classroom already have the student, otherwise it includ it
    classroom.student.push(self) unless classroom.student.include?(self)
  end

  def play_hooky
    '"¯\\(ツ)/¯"'
  end
end
