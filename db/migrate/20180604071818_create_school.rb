class CreateSchool < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :address
      t.string :zip_code
      t.string :city
      t.string :opening_hours
      t.string :phone_number
      t.string :email
      t.float :latitude
      t.float :longitude
      t.integer :student_number
      t.string :status

      t.timestamps
    end
  end
end
