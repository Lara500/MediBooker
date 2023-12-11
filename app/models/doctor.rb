class Doctor < ApplicationRecord
    has_many :appointments
    has_many :patients, through: :appointments

    validates :first_name, :last_name, presence: true

    def full_name
        "#{first_name} #{last_name}"
    end
end
