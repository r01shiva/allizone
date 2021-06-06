# frozen_string_literal:true

class AuthenticateUser
  prepend SimpleCommand
  attr_accessor :email, :password, :device_uid, :status_code, :authenticated_user, :user_class

  def initialize(email, password, device_uid, user_class = 'User')
    @email = email
    @password = password
    @device_uid = device_uid
    @user_class = user_class
  end

  def call
    @authenticated_user = user
    return nil unless @authenticated_user

    # if @authenticated_user.class == User
    JsonWebToken.encode(user_id: @authenticated_user.id, device_uid: device_uid)
    # else
    #   JsonWebToken.encode(employee_id: @authenticated_user.id, device_uid: device_uid)
    # end
  end

  private

  def user
    fetched_user = fetch_user
    # if fetched_user.present? && fetched_user.company.active? && active_module?(fetched_user) # && fetched_user.authenticate(password)
    if fetched_user.present? #&& fetched_user.company.active? && active_module?(fetched_user) # && fetched_user.authenticate(password)
      if fetched_user.device_uid.nil? || fetched_user.device_uid == device_uid
        self.status_code = 200
        fetched_user
      else
        self.status_code = 410
        errors.add :base, 'Please log out from your previous device'
        nil
      end
    else
      self.status_code = 401
      errors.add :base, 'Invalid Credentials'
      nil
    end
  end

  # def active_module?(fetched_user)
  #   return true if fetched_user.is_a? User
  #
  #   fetched_user.company.employee_module
  # end

  def fetch_user
    user_model = user_class.constantize
    user = user_model.without_deleted.find_by(email: email)
    return user if user && user.authenticate(password)

    nil
  rescue
    nil
  end
end
