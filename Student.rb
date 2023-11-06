require 'Person.rb'

class Student < Person
    def initialize(name:"Unknown", age, parent_permission: true, classroom)
        super()
        @classroom: classroom
    end

    def play_hooky
    end