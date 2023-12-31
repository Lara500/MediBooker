class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :pesel
      t.string :city
      t.date :birth_date
      t.string :gender

      t.timestamps
    end
  end
end
