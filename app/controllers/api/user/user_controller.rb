# frozen_string_literal:true

class Api::User::UserController < Api::User::ApplicationController
  def all_users
    response = User.all
    @response[:data] = response
    @response[:status] = 200
    send_response
  end

  def register
    resource = User.new(register_params)
    if resource.save!
      @response[:message] = 'Your account created successfully'
      @response[:data][:email] = params[:email]
      @response[:data][:mobile_no] = params[:mobile_no]
      @response[:status] = 200
      send_response
    end
  rescue ActiveRecord::RecordInvalid => e
  @response[:status] = 400
  @response[:message] = e.message
  send_response
  end
  
  private

  def register_params
    params.permit(
      :email, :mobile_no, :password,
      :password_confirmation, :app_version
    )
  end
end
