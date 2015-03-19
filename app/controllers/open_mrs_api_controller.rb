class OpenMrsApiController < ApplicationController
  def search
    patient_name = params[:name]

    uri = URI.parse("http://localhost:8081/openmrs-standalone/ws/rest/v1/patient?q=#{patient_name}")

    req = Net::HTTP::Get.new(uri.request_uri)
    req.basic_auth 'admin', 'Admin123'

    req["Content-Type"] = "application/json"

    res = Net::HTTP.start(uri.hostname, uri.port) {|http|
      http.request(req)
    }
    render json: res.body
  end
end
