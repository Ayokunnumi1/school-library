require_relative 'display_menu'

private

  def display_menu
    puts ''
    puts 'Welcome to School Library!'
    puts '=================================='
    puts 'Please select an option:'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List rentals for a person'
    puts '7. Quit'
    puts '=================================='
  end

  def handle_choice(choice)
    if @choices.key?(choice)
      @choices[choice].call
    else
      invalid_choice
    end
  end