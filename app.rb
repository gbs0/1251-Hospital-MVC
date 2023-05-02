require 'csv'
require_relative 'router'

require_relative 'app/controllers/patients_controller'
require_relative 'app/controllers/rooms_controller'
require_relative 'app/repositories/patient_repository'
require_relative 'app/repositories/room_repository'

# Instanciando os repositórios
patients_csv = 'app/data/patients.csv'
rooms_csv = 'app/data/rooms.csv'
room_repository = RoomRepository.new(rooms_csv)
patient_repository = PatientRepository.new(patients_csv, room_repository)

# Instanciando os controllers
patients_controller = PatientsController.new(patient_repository, room_repository)
rooms_controller = RoomsController.new(room_repository)

# Entregando as classes do controller p/ o Router
router = Router.new(patients_controller, rooms_controller)

router.run