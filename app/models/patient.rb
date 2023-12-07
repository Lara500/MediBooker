class Patient < ApplicationRecord
    has_many :appointments
    has_many :doctors, through: :appointments 

    validates :first_name, :last_name, :pesel, :city, :birth_date, :gender, presence: true
end
