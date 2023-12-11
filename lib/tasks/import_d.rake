require 'csv'
require 'smarter_csv'

namespace :import_d do
  desc "Import doctors from a CSV file"
  task doctors: :environment do
    file = 'fake_medical_doctors.csv'

    SmarterCSV.process(file).each do |row|
      Doctor.create(row)
    end
  end
end