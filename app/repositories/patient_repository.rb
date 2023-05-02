require 'pry'
require_relative '../models/patient'

class PatientRepository
  def initialize(csv_file, room_repository)
    @csv = csv_file
    @room_repository = room_repository
    @patients = []
    load_csv if File.exist?(@csv)
    @next_id = @patients.empty? ? 1 : @patients.last.id + 1
  end

  def create(patient)
    patient.id = @next_id 
    @next_id += 1
    @patients << patient
    save_csv
  end

  def find(id)
    @patients.find { |patient| patient.id == id }
  end

  def all
    @patients
  end

  def save_csv
    CSV.open(@csv, 'wb', headers: :first_row, header_converters: :symbol) do |row|
      row << %w[id name age cured room_id]
      @patients.each do |patient|
        row << [patient.id, patient.name, patient.age, patient.cured, patient.room.id]
      end
    end
  end

  def load_csv
    # Atributos do .foreach
    # gabriel, 26, false
    # linha[0], linha[1], linha[2] => Foreach sem atributos
    # linha['name'], linha['age'], linha['cured'] # => headers: :first_row
    # linha[:name], linha[:age], linha[:cured] #=> headers_converter: :symbol
    CSV.foreach(@csv, headers: :first_row, header_converters: :symbol) do |row|
      room = @room_repository.find(row[:room_id].to_i)
      patient = Patient.new(id: row[:id].to_i, name: row[:name], age: row[:age].to_i, cured: row[:cured])
      patient.room = room
      @patients << patient
    end
  end
end