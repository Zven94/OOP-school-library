# define Classroom class
class Classroom
  # define getter&setter for @label
  attr_accessor :label, :student

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    students << student
    student.classroom = self
  end
end
