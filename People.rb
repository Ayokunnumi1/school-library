class Person 
    attr_accessor :name, :age
    attr_reader :id
    def initialize(name:"Unknown", age, parent_permission: true)
        @name: name
        @age: age
        @parent_permission: parent_permission
    end

    def can_use_services?
    return true if of_age? || @parent_permission
    end

    private

    def of_age?
    return true if age >= 18
    else false
    end
    
end