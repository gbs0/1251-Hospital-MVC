class Room
  attr_accessor :patients
  attr_reader :number, :capacity, :id

  def initialize(attributes = {}) # => Room.new(number: 123, capacity: 10)
    @id = attributes[:id]
    @number = attributes[:number]
    @capacity = attributes[:capacity]
    @patients = attributes[:patients] || []
  end

  def add_patient(patient)
    raise StandardError, "Room is full!" if full?
    @patients.push(patient)
    patient.room = self
  end

  def full?
    @patients.size == @capacity
  end
end

# sala = Room.new(number: 123, capacity: 10)
# gabriel = Patient.new(name: "gabriel", idade: 26)

# sala.add_patient(gabriel)

# puts gabriel.room.number # => 123
# puts gabriel.room.capacity # => 10