# frozen_string_literal:true

class Api::User::AuthenticationController < Api::User::ApplicationController
  skip_before_action :authenticate_request, only: %i[authenticate app_version]
  def authenticate
    if params[:device_uid].blank?
      @response[:message] = 'Device id missing.'
      @response[:status] = 401
      send_response
    else
      authenticate_and_send_response
    end
  end

  def app_version
    @current_user = AuthorizeApiRequest.call(request.headers, User).result
    @response[:data][:app_version] = MOBILE_APP[:app_version]
    update_current_user_app_version
    send_response
  end

  def authenticate_and_send_response
    @command = AuthenticateUser.call(params[:email], params[:password], params[:device_uid], 'User')
    if @command.success?
      @user = @command.authenticated_user
      if @user.update!(
        device_uid: params[:device_uid],
        app_version: params[:app_version]
      )
        @response[:data][:auth_token] = @command.result
        @response[:data][:app_version] = MOBILE_APP[:app_version]
        # work_log_id = @user.current_work_log.blank? ? 0 : @user.current_work_log.id
        # @response[:data][:work_log_id] = work_log_id
        # @response[:data][:user] = @user.user_info_for_mobile_app
        # @response[:data][:on_going_trip] = @user.current_work_log_id.present?
        # set_user_info
        # @response[:data][:speed_offset] = @user.company.speed_offset_parameters
        # @response[:data][:finish_work_offset] = @user.company.finish_work_offset
        authorised_response
      else
        @response[:message] = @user.errors.full_messages.join(',') if @user.errors.any?
        unauthorised_response
      end
    else
      @response[:message] = @command.errors.full_messages.join(',') if @command.errors.any?
      unauthorised_response
    end
  end

  def unauthorised_response
    @response[:status] = @command.status_code
    send_response
  end

  def authorised_response
    @response[:message] = 'success'
    @response[:status] = @command.status_code
    send_response
  end

  # def set_user_info
  #   @response[:data][:work_duration] = @user.work_duration
  #   @response[:data][:speed_offset] = @user.company.speed_offset_parameters
  #   @response[:data][:permissions] = @user.company.company_permissions_for_mobile_app
  #   @response[:data][:location_update_interval] = LOCATION_INTERVAL
  #   if mobile_app_version >= 6.2
  #     @response[:data][:fleets_info] = @user.latest_used_fleets
  #     @response[:data][:checklist] = @user.latest_fleet_pre_start_checklist
  #     @response[:data][:trailer_checklist] = @user.company.trailer_check_template
  #   else
  #     @response[:data][:fleets_info] = @user.current_fleets_info
  #   end
  #   get_current_trip_info
  #   @response[:data][:last_created_at] = last_created_at
  #   set_speed_breach_template
  #   rest_breach_info
  # end

  # def get_current_trip_info
  #   if @user.company.fleet_service_module || @user.company.fatigue_management_module
  #     @response[:data][:trip_info] = @user.current_trip_info
  #   else
  #     @response[:data][:trip_info] = @user.current_trip_info_without_fatigue_and_maintenance
  #   end
  # end

  # def set_speed_breach_template
  #   return unless @user.company.speed_breach?
  #
  #   speed_breach_template = @user.company.speed_breach_template
  #   @response[:data][:speed_breach_template] = {
  #     base_speed_limit: speed_breach_template.base_speed_limit,
  #     low: {
  #       speed_upto: speed_breach_template.low_speed_upto,
  #       time: speed_breach_template.low_speed_time
  #     },
  #     medium: {
  #       speed_upto: speed_breach_template.medium_speed_upto,
  #       time: speed_breach_template.medium_speed_time
  #     },
  #     high: {
  #       speed_upto: speed_breach_template.high_speed_upto,
  #       time: speed_breach_template.high_speed_time
  #     },
  #     extreme: {
  #       time: speed_breach_template.extreme_speed_time
  #     }
  #   }
  # end

  # def company_permissions
  #   @user = current_user
  #   @response[:data][:permissions] = @user.company.company_permissions_for_mobile_app
  #   set_speed_breach_template
  #   @response[:data][:location_update_interval] = LOCATION_INTERVAL
  #   @response[:data][:speed_offset] = @user.company.speed_offset_parameters
  #   send_response
  # end

  # def last_created_at
  #   return nil if @user.last_activity.blank?
  #
  #   @user.last_activity.created_at.strftime('%Y-%m-%d %H:%M:%S')
  # end
end
