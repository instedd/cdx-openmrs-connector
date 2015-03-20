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
end
