require_relative '../../lib/classes/password_validator'

class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 255 }
  validates_with PasswordValidator

  has_secure_password
end
