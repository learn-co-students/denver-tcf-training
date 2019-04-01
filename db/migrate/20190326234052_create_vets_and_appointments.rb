class CreateVetsAndAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :vets do |table|
      table.string :location
    end

    create_table :appointments do |t|
      t.references(:vet) # also add an index
      t.integer :appointment_id
    end
  end
end
