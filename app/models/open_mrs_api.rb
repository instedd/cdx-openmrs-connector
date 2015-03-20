require 'net/http'

class OpenMrsApi

  def search_patients name
    uri = URI.parse("http://localhost:8081/openmrs-standalone/ws/rest/v1/patient?q=#{name}")

    req = Net::HTTP::Get.new(uri.request_uri)
    req.basic_auth 'admin', 'Admin123'

    req["Content-Type"] = "application/json"

    res = Net::HTTP.start(uri.hostname, uri.port) {|http|
      http.request(req)
    }

    res.body
  end

  def search_encounters patient_uuid
    uri = URI.parse("http://localhost:8081/openmrs-standalone/ws/rest/v1/encounter/?patient=#{patient_uuid}")

    req = Net::HTTP::Get.new(uri.request_uri)
    req.basic_auth 'admin', 'Admin123'

    req["Content-Type"] = "application/json"

    res = Net::HTTP.start(uri.hostname, uri.port) {|http|
      http.request(req)
    }

    res.body
  end

  def report_sample patient_sample
    uri = URI.parse("http://localhost:8081/openmrs-standalone/ws/rest/v1/obs/")

    req = Net::HTTP::Post.new(uri.request_uri)
    req.basic_auth 'admin', 'Admin123'
    req.body = {
      person: patient_sample.patient_uuid,
      obsDatetime: DateTime.now,
      concept: SAMPLE_ID_CONCEPT,
      encounter: patient_sample.encounter_uuid,
      value: patient_sample.sample_id
    }.to_json

    req["Content-Type"] = "application/json"

    res = Net::HTTP.start(uri.hostname, uri.port) {|http|
      http.request(req)
    }

    res.body
  end
end