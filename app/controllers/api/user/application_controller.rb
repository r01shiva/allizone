# frozen_string_literal:true

class Api::User::ApplicationController < Api::ApplicationController
  before_action :authenticate_request, except: :register

  # def invalid_otp?(fleets_info)
  #   fleets_info.any? do |fleet_info|
  #     fleet_info[:fleet].present? && fleet_info[:fleet].otp_required? &&
  #       !fleet_info[:fleet].valid_otp?(fleet_info[:otp])
  #   end
  # end

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers, 'User').result
    return if @current_user.present?

    send_session_expired
  end
end
