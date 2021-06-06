# frozen_string_literal:true

class Api::User::SmartRoomController < Api::User::ApplicationController
  def get_temperature
    payload = HTTParty.get('http://192.168.0.164/temperature')
    response = JSON.parse(payload.parsed_response, :symbolize_names => true)
    @response[:data] = response
    @response[:status] = 200
    send_response
  end
end
