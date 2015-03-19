class PatientSample < ActiveRecord::Base
  attr_accessible :patient_uuid, :sample_id, :encounter_uuid
  validates_presence_of :patient_uuid, :sample_id, :encounter_uuid
end
