require 'sinatra'
require 'json'
require 'net/http'

set :bind, '0.0.0.0'

before do
  content_type :json
end

get '/' do
  redirect '/index.html'
end

get '/patient' do
  patient_name = params[:name]

  uri = URI.parse("http://localhost:8081/openmrs-standalone/ws/rest/v1/patient?q=#{patient_name}")

  req = Net::HTTP::Get.new(uri.request_uri)
  req.basic_auth 'admin', 'Admin123'

  req["Content-Type"] = "application/json"

  res = Net::HTTP.start(uri.hostname, uri.port) {|http|
    http.request(req)
  }
  res.body
end