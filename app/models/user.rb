# frozen_string_literal:true

class User < ApplicationRecord
  include SoftDelete
  has_secure_password
  before_validation { self.email = email.downcase }
  validates :email, uniqueness: true
  validates :mobile_no, uniqueness: true
  # validates :password, presence: true, confirmation: true
  # validates_confirmation_of :password
end
