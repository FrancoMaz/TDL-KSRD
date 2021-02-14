require 'bcrypt'

class User < ActiveRecord::Base

  include BCrypt

  has_secure_password

  before_save { self.email = email.downcase }

  validates :name, :presence => true,
            :length => { :maximum => 40 }

  validates :email, :presence => true, uniqueness: { case_sensitive: false }

  validates :password, :length => { :within => 6..50 }

end
