require_relative 'app'

class Main
  def initialize
    @app = App.new
    @choices = {
      1 => -> { @app.list_all_books },
      2 => -> { @app.list_all_people },
      3 => -> { @app.create_person },
      4 => -> { @app.create_book },
      5 => -> { @app.create_rental },
      6 => -> { @app.list_rentals_for_person },
      7 => -> { quit }
    }
  end

  def main
    loop do
      display_menu
      choice = gets.chomp.to_i
      handle_choice(choice)
    end
  end

  

  

  def quit
    puts 'Thank you for using School Library. Goodbye!'
    exit
  end

  def invalid_choice
    puts 'Invalid choice. Please try again.'
  end
end

Main.new.main
