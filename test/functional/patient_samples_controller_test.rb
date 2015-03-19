require 'test_helper'

class PatientSamplesControllerTest < ActionController::TestCase
  setup do
    @patient_sample = patient_samples(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patient_samples)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create patient_sample" do
    assert_difference('PatientSample.count') do
      post :create, patient_sample: {  }
    end

    assert_redirected_to patient_sample_path(assigns(:patient_sample))
  end

  test "should show patient_sample" do
    get :show, id: @patient_sample
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @patient_sample
    assert_response :success
  end

  test "should update patient_sample" do
    put :update, id: @patient_sample, patient_sample: {  }
    assert_redirected_to patient_sample_path(assigns(:patient_sample))
  end

  test "should destroy patient_sample" do
    assert_difference('PatientSample.count', -1) do
      delete :destroy, id: @patient_sample
    end

    assert_redirected_to patient_samples_path
  end
end
