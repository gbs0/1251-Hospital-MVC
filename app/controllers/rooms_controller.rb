require_relative '../views/room_view'

class RoomsController
  def initialize(room_repository)
    @room_repository = room_repository
    @view = RoomView.new
  end

  def create
    number = @view.ask_for("number").to_i

    capacity = @view.ask_for("capacity").to_i

    room = Room.new(number: number, capacity: capacity)
    @room_repository.create(room)
  end

  def list
    rooms = @room_repository.all
    @view.list(rooms)
  end
end