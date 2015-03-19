class CreatePatientSamples < ActiveRecord::Migration
  def change
    create_table :patient_samples do |t|
      t.string :patient_uuid
      t.string :sample_id
      t.string :encounter_uuid
      t.timestamps
    end
  end
end
