class User < ActiveRecord::Base
  attr_accessible :email, :name, :password_digest, :password, :password_confirmation, :subscriptions, :subscriptions_attributes
  has_many :subscription_plans, :through => :subscriptions
  has_many :subscriptions, :inverse_of => :subscriber

  accepts_nested_attributes_for :subscriptions
  has_secure_password

  validates :email, :name, :password_digest, :presence => true
end
