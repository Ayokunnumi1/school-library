require './person'
class Teacher < Person
  def initialize(age, specialization, name: 'unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def assign_id(id)
    @id = id
  end
end
