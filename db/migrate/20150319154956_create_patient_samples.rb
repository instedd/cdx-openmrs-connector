class CreatePatientSamples < ActiveRecord::Migration
  def change
    create_table :patient_samples do |t|
      t.string :patient_uuid
      t.string :sample_id
      t.string :encounter_uuid
      t.string :patient_name
      t.string :encounter_name
      t.timestamps
    end

    add_index :patient_samples, :sample_id, unique: true
  end
end
