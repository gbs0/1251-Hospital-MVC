require_relative '../models/room'

class RoomRepository
  def initialize(csv_file)
    @csv = csv_file
    @rooms = []
    load_csv if File.exist?(@csv)
    @next_id = @rooms.empty? ? 1 : @rooms.last.id + 1
  end

  def create(room)
    room.id = @next_id 
    @next_id += 1
    @rooms << room
    save_csv
  end

  def find(id)
    @rooms.find { |room| room.id == id }
  end

  def all
    @rooms
  end

  def save_csv
    CSV.open(@csv, 'wb', headers: :first_row, header_converters: :symbol) do |row|
      row << %w[id number capacity]
      @rooms.each do |room| 
        row << [room.id, room.number, room.capacity]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv, headers: :first_row, header_converters: :symbol) do |row|
      room = Room.new(id: row[:id].to_i, number: row[:number].to_i, capacity: row[:capacity].to_i)
      @rooms << room
    end
  end
end