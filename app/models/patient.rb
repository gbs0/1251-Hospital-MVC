class Patient
  attr_accessor :name, :age, :room, :id
  attr_reader :cured

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @age = attributes[:age]
    @cured = attributes[:cured] || false
  end

  def cure!
    @cured = true
  end
end
