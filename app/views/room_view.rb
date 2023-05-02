class RoomView
    def list(rooms)
      puts " - Rooms List: " + ('-' * 30)
      puts '-' * 30
      rooms.each do |room|
        puts "#{room.id} - Number: #{room.number} | Capacity: #{room.capacity}"
      end
      puts '-' * 30
    end
  
    def ask_for(parameter)
      puts "What's the room #{parameter}?"
      print "> "
      gets.chomp
    end
  end