class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name: 'Unknown', parent_permission: true)
    @id = nil
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    true if of_age? || @parent_permission
  end

  private

  def of_age?
    true if age >= 18
  end
end
