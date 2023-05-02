require_relative '../views/patient_view'
require_relative '../views/room_view'

class PatientsController

  def initialize(patient_repository, room_repository)
    @patient_repository = patient_repository
    @room_repository = room_repository
    @view = PatientView.new
    @room_view = RoomView.new
  end


  def create
    # 1. Perguntar o nome do patient
    name = @view.ask_for("name")
    # 2. Perguntar a idade do patient
    age = @view.ask_for("age").to_i

    # 3. Mostrar uma lista com as salas disponiveis
    rooms = @room_repository.all
    @room_view.list(rooms)

    # 4. Pergunta ao user, em qual sala ele desejar assimilar o paciente
    # (ID da sala)
    room_id = @room_view.ask_for("id").to_i
    room = @room_repository.find(room_id)

    # . Transformar os dados do user, em um objeto Patient.new
    patient = Patient.new(name: name, age: age, room: room)
    
    # . Adicionar o paciente na sala
    room.add_patient(patient)
    # . Manda o novo patient ao repo p/ salvar CSV
    @patient_repository.create(patient)
  end

  def list
    patients = @patient_repository.all
    @view.list(patients)
  end
end