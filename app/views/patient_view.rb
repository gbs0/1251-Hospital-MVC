class PatientView
  def list(patients)
    puts " - Patients List: " + ('-' * 30)
    puts '-' * 30
    patients.each_with_index do |patient, index|
      room = patient.room.nil? ? "No room yet" : patient.room.number
      puts "#{index + 1} - Name: #{patient.name} | Age: #{patient.age} | Cured?: #{patient.cured} | Room: #{room}"
    end
    puts '-' * 30
  end

  def ask_for(parameter)
    puts "What's the user #{parameter}?"
    print "> "
    gets.chomp
  end
end