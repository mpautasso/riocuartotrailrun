class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :dni
      t.string :sex
      t.datetime :dob
      t.string :city
      t.string :gym
      t.string :email
      t.string :phone
      t.string :emergency_phone
      t.string :medical_insurance
      t.string :shirt_size

      t.timestamps
    end
  end
end
