class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  validates :date, :time, :doctor_id, :patient_id, :price, presence: true
  validate :validate_unique_appointment

  def validate_unique_appointment
    return if self.persisted? && !doctor_id_changed? && !date_changed? && !time_changed?
  
    if Appointment.where(doctor_id: doctor_id, date: date, time: time)
                  .where.not(id: id).exists?
      errors.add(:base, 'Ten termin jest zajęty.')
    end
  end
  
end
