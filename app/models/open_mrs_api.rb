require 'net/http'

class OpenMrsApi

  def search_patients name
    uri = URI.parse("#{Settings.openmrs_base_url}/patient?q=#{name}")

    req = Net::HTTP::Get.new(uri.request_uri)
    req.basic_auth 'admin', 'Admin123'

    req["Content-Type"] = "application/json"

    res = Net::HTTP.start(uri.hostname, uri.port) {|http|
      http.request(req)
    }

    res.body
  end

  def search_encounters patient_uuid
    uri = URI.parse("#{Settings.openmrs_base_url}/encounter/?patient=#{patient_uuid}")

    req = Net::HTTP::Get.new(uri.request_uri)
    req.basic_auth 'admin', 'Admin123'

    req["Content-Type"] = "application/json"

    res = Net::HTTP.start(uri.hostname, uri.port) {|http|
      http.request(req)
    }

    res.body
  end

  def report_sample patient_sample
    uri = URI.parse("#{Settings.openmrs_base_url}/obs/")

    req = Net::HTTP::Post.new(uri.request_uri)
    req.basic_auth 'admin', 'Admin123'
    req.body = {
      person: patient_sample.patient_uuid,
      obsDatetime: DateTime.now,
      concept: Settings.sample_id_concept_uuid,
      encounter: patient_sample.encounter_uuid,
      value: patient_sample.sample_id
    }.to_json

    req["Content-Type"] = "application/json"

    res = Net::HTTP.start(uri.hostname, uri.port) {|http|
      http.request(req)
    }

    res.body
  end

  def register_result patient_sample, result
    uri = URI.parse("#{Settings.openmrs_base_url}/obs/")

    req = Net::HTTP::Post.new(uri.request_uri)
    req.basic_auth 'admin', 'Admin123'
    req.body = {
      person: patient_sample.patient_uuid,
      obsDatetime: DateTime.now,
      concept: Settings.sample_result_concept_uuid,
      encounter: patient_sample.encounter_uuid,
      value: "#{patient_sample.sample_id} :: #{result}"
    }.to_json

    req["Content-Type"] = "application/json"

    res = Net::HTTP.start(uri.hostname, uri.port) {|http|
      http.request(req)
    }

    res.body
  end
end