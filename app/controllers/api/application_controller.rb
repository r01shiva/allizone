# frozen_string_literal:true

class Api::ApplicationController < ActionController::API
  before_action :response_data
  attr_reader :current_user

  def logout
    @current_user.update(device_uid: nil)
    send_response
  end

  def update_current_user_app_version
    return if @current_user.blank? || params[:app_version].blank? || @current_user.app_version == params[:app_version]

    @current_user.update_attributes(app_version: params[:app_version])
  end

  def send_response(log_exception = nil)
    log_data(log_exception) #unless action_name == 'fleet_current_location'
    render json: { response: @response }
  end

  rescue_from Exception do |exception|
    @response[:message] = exception.message
    @response[:status] = 400
    info = {
      rails_env: Rails.env,
      request: {
        ip: request.ip,
        parameters: request.filtered_parameters
      }
    }
    if current_user.present?
      info[:user_id] = current_user.id
      info[:user_name] = current_user.name
      # info[:last_activity] = current_user.last_activity_action
      # info[:current_fleets_ids] = current_user.fleets.try(:ids) if user?
      info[:user_type] = user? ? 'user' : 'Other'
    end

    ExceptionNotifier.notify_exception(exception, data: info) if exception.class != ActiveRecord::RecordNotUnique

    send_response(exception)
  end

  def errors_to_s(resource)
    resource.errors.full_messages.join(', ').html_safe if resource.errors.any?
  end

  def user?
    current_user.class.to_s == 'user'
  end

  def send_session_expired
    @response[:message] = 'Session Expired'
    @response[:status] = 440
    send_response
  end

  def mobile_app_version
    params[:app_version].to_f
  end

  private

  def log_data(log_exception)
    logger.info "\n\n"
    logger.info 'API request starts---------------------'
    logger.info "API URL: #{request.url}"
    log_user_info if current_user.present?
    if log_exception.present?
      log_exception_data(log_exception)
    else
      logger.info "params: #{request.filtered_parameters}"
    end
    logger.info "response: #{@response}"
    logger.info 'API request ends---------------------'
  end

  def log_exception_data(exception)
    logger.info '###########################  Exception Starts ############################'
    logger.error exception
    logger.info "IP Address: #{request.ip}, parameters: #{request.filtered_parameters}"
    logger.info '###########################  Exception Ends ############################'
  end

  def log_user_info
    logger.info 'user Info: '
    logger.info "id: #{current_user.id}, Name #{current_user.name},
    Email: #{current_user.email}}"
  end

  # def log_user_info
  #   if user?
  #     logger.info 'user Info: '
  #     logger.info "id: #{current_user.id}, Name #{current_user.name},
  #     Email: #{current_user.email}, Fleet Info: #{current_user.fleets.try(:ids)},
  #     Last Activity: #{current_user.last_activity_action}"
  #   else
  #     logger.info 'Other Info: '
  #     logger.info "id: #{current_user.id}, Name #{current_user.name},
  #     Email: #{current_user.email},
  #     Last Activity: #{current_user.last_activity_action}"
  #   end
  # end

  def response_data
    @response = {
      data: {},
      message: 'success',
      status: 200
    }
  end
end
