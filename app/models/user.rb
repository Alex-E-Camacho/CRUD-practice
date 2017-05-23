class User < ActiveRecord::Base
  validates :email, :presence => true, :uniqueness => true
  validates :first_name, :last_name, :presence => true

  has_many :subscriptions
  has_many :channels, :through => :subscriptions

  has_secure_password

  def total_price_of_subscriptions
    self.channels.reduce(0) { |memo, channel| memo + channel.price_per_month }
  end

  def subscribed?(channel)
    self.channels.include?(channel)
  end

end
