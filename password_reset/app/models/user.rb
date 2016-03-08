class User < ActiveRecord::Base
  validates :password,
    presence: true,
    on: :create

  validates :email,
    presence: true,
    uniqueness: {case_sensitive: false}

  has_secure_password
end
