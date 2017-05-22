class User < ActiveRecord::Base
  validates :email, :presence => true, :uniqueness => true
  validates :first_name, :last_name, :presence => true

  has_many :subscriptions
  has_many :channels, :through => :subscriptions

  has_secure_password
end
