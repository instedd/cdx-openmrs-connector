class PatientSamplesController < ApplicationController

  layout 'application'

  def initialize
    super
    @openmrs_api = OpenMrsApi.new
  end

  # GET /patient_samples
  # GET /patient_samples.json
  def index
    @patient_samples = PatientSample.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @patient_samples }
    end
  end

  # GET /patient_samples/1
  # GET /patient_samples/1.json
  def show
    @patient_sample = PatientSample.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @patient_sample }
    end
  end

  # GET /patient_samples/new
  # GET /patient_samples/new.json
  def new
    @patient_sample = PatientSample.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @patient_sample }
    end
  end

  # GET /patient_samples/1/edit
  def edit
    @patient_sample = PatientSample.find(params[:id])
  end

  # POST /patient_samples
  # POST /patient_samples.json
  def create
    @patient_sample = PatientSample.new(params[:patient_sample])

    respond_to do |format|
      if @patient_sample.save
        report_patient_sample @patient_sample
        format.html { redirect_to @patient_sample, notice: 'Sample was successfully registered' }
        format.json { render json: @patient_sample, status: :created, location: @patient_sample }
      else
        format.html { render action: "new" }
        format.json { render json: @patient_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /patient_samples/1
  # PUT /patient_samples/1.json
  def update
    @patient_sample = PatientSample.find(params[:id])

    respond_to do |format|
      if @patient_sample.update_attributes(params[:patient_sample])
        format.html { redirect_to @patient_sample, notice: 'Patient sample was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @patient_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patient_samples/1
  # DELETE /patient_samples/1.json
  def destroy
    @patient_sample = PatientSample.find(params[:id])
    @patient_sample.destroy

    respond_to do |format|
      format.html { redirect_to patient_samples_url }
      format.json { head :no_content }
    end
  end

  def report_patient_sample patient_sample
    response = @openmrs_api.report_sample patient_sample
    JSON.parse(response)['uuid']
  end
end
