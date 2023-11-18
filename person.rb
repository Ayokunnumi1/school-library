require 'json'
require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = nil
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def assign_id(id)
    @id = id
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  def to_json(*args)
    {
      id: @id,
      type: self.class.to_s.downcase,
      age: @age,
      name: @name,
      rentals: @rentals.map { |rental| { date: rental.date, book_id: rental.book.id, person_id: rental.person.id } }
      # rentals: @rentals.map(&:to_json)
    }.to_json(*args)
  end

  def self.from_json(json)
    data = JSON.parse(json)
    person = Person.new(data['age'], data['name'])
    person.assign_id(data['id']) # Assign the ID from the JSON data
    data['rentals'].each do |rental_data|
      rental = Rental.from_json(rental_data)
      rental.person = person
      person.rentals << rental
    end
    person
  end

  private

  def of_age?
    age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end
end

# person = Person.new(22, name: 'maximilianus')
# person.correct_name
# capitalized_person = CapitalizeDecorator.new(person)
# puts capitalized_person.correct_name
# capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
# puts capitalized_trimmed_person.correct_name
