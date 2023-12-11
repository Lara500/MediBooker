require 'csv'
require 'smarter_csv'

namespace :import do
  desc "Import patients from a CSV file"
  task patients: :environment do
    file = 'fake_medical_patients.csv'
    row_number = 0

    SmarterCSV.process(file).each do |row|
        row_number += 1
      birth_date, gender = parse_pesel(row[:pesel])
      Patient.create(row.merge(birth_date: birth_date, gender: gender))
      puts "Wiersz #{row_number}"
    end
  end

  def parse_pesel(pesel)
    pesel = pesel.to_s
    puts "PESEL: #{pesel}"

    year = pesel.slice(0, 2).to_i 
    month = pesel.slice(2, 2).to_i 
    day = pesel.slice(4, 2).to_i   

    century_offset = month / 20
    month %= 20
  
    case century_offset
    when 0 then year += 1900  # lata 1900 - 1999
    when 1 then year += 2000  # lata 2000 - 2099
    end
  
    birth_date = Date.new(year, month, day)
    gender = pesel[9].to_i.odd? ? 'M' : 'K'
  
    [birth_date, gender]
  end
end