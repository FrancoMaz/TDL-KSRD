class User < ActiveRecord::Base

  before_save { self.email = email.downcase }

  validates :name, :presence => true,
            :length => { :maximum => 40 }

  validates :email, :presence => true

  validates :password, :presence => true,
            :length => { :within => 2..50 },
            confirmation: true
   validates_confirmation_of :password

end
