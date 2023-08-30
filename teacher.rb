# frozen_string_literal: true

require_relative 'person'

# creating a Person subclass: teacher
class Teacher < Person
  def initialize(specialization = 'Unknown', name = 'Unknown', age = 0, parent_permission: true)
    super(name, age, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
