class Channel < ActiveRecord::Base
  validates :callsign, :name, :presence => true, :uniqueness => true
  validates :price_per_month, :presence => true

  has_many :subscriptions
  has_many :subscribers, :through => :subscriptions, :source => :user 
end
