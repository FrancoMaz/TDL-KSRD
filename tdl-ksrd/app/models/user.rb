require 'bcrypt'

class User < ApplicationRecord

  include BCrypt

  has_secure_password

  before_save { self.email = email.downcase }

  before_create :add_hash_for_url

  has_many :comments

  validates :name, :presence => true,
            :length => { :maximum => 40 }

  validates :email, :presence => true, uniqueness: { case_sensitive: false }

  validates :password, :length => { :within => 6..50 }

  def add_hash_for_url
    self.hash_for_url = Sysrandom.hex(32)
  end


end
