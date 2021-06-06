# frozen_string_literal:true

class AuthorizeApiRequest
  prepend SimpleCommand

  def initialize(headers = {}, user_class = 'User')
    @headers = headers
    @user_class = user_class
  end

  def call
    user
  end

  private

  attr_reader :headers, :user_class

  def user
    fetched_user = fetch_user if decoded_auth_token
    fetched_user || errors.add(:token, 'Invalid token') && nil
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    return headers['Authorization'].split(' ').last if headers['Authorization'].present?

    errors.add(:token, 'Missing token')
    nil
  end

  def skip_device_uid?
    white_listed_paths = [
      # '/api/report_incident', '/api/user/report_incident',
      # '/api/fleet_current_location', '/api/user/fleet_current_location',
      # '/api/user/record_speed_breach'
    ]

    white_listed_paths.include? headers[:REQUEST_PATH]
  end

  def fetch_user
    user_id = decoded_auth_token[:user_id]
    user_model = user_class.constantize
    if skip_device_uid?
      user_model.without_deleted.find_by_id(user_id)
    else
      user_model.without_deleted.find_by(id: user_id)
      # user_model.without_deleted.find_by(id: user_id, decoded_auth_token[:device_uid])
    end
  rescue
    nil
  end
end
