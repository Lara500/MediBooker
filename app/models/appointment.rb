class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  validates :date, :time, :doctor_id, :patient_id, :price, presence: true
  validate :validate_unique_appointment

  def validate_unique_appointment
    if Appointment.exists?(doctor_id: doctor_id, date: date, time: time)
      errors.add(:base, 'This date is already booked.')
    end
  end
end
