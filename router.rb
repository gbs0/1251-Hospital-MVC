class Router

  def initialize(patients_controller, rooms_controller)
    @patients_controller = patients_controller
    @rooms_controller = rooms_controller
  end

  def run
    loop do
      menu
      user_action = gets.chomp.to_i
      dispatch(user_action)
    end
  end

  def menu
    puts ('-' * 10) + " PATIENTS " + ('-' * 10)
    puts "1. Create Patient"
    puts "2. List Patient(s)"
    puts ('-' * 30)
    puts ('-' * 10) + " ROOMS " + ('-' * 10)
    puts "3. Create Room"
    puts "4. List Room(s)"
    puts ('-' * 30)
    puts "Chose an option:"
    print "> "
  end

  def dispatch(user_action)
    case user_action
    when 1
        @patients_controller.create
    when 2
        @patients_controller.list
    when 3
        @rooms_controller.create
    when 4
        @rooms_controller.list
    else
        puts "Invalid Option!"
    end
  end
end