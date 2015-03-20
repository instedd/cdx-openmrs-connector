class OpenMrsApiController < ApplicationController
  def initialize
    @api = OpenMrsApi.new
  end

  def search_patients
    patient_name = params[:name]

    render json: @api.search_patients(patient_name)
  end

  def search_encounters
    patient_uuid = params[:patient]

    render json: @api.search_encounters(patient_uuid)
  end

  def register_result
    sample_id = params[:sample]
    result = params[:result]

    patient_sample = PatientSample.where(sample_id: sample_id).first

    if patient_sample
      render json: @api.register_result(patient_sample, result)
    else
      render json: {success: false, error: "Unknown Sample ID: #{sample_id}"}
    end
  end
end
