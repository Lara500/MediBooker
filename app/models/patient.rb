class Patient < ApplicationRecord
    has_many :appointments
    has_many :doctors, through: :appointments 

    validates :first_name, :last_name, :pesel, :city, :birth_date, :gender, presence: true

    enum gender: { Mężczyzna: 'M', Kobieta: 'K', other: 'other' }
    
    def self.ransackable_attributes(auth_object = nil)
        %w[gender last_name birth_date]
      end
end
