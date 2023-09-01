# frozen_string_literal: true

# creating a Person subclass: teacher
class Teacher < Person
  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    super(name, age, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
