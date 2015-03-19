class PatientSample < ActiveRecord::Base
  attr_accessible :patient_uuid, :sample_id, :encounter_uuid, :patient_name, :encounter_name
  validates_presence_of :patient_uuid, :sample_id, :encounter_uuid, :patient_name, :encounter_name
  validates_uniqueness_of :sample_id
end
