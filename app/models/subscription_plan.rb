class SubscriptionPlan < ActiveRecord::Base
  attr_accessible :price, :weekly, :newspaper_id

  belongs_to :newspaper, :inverse_of => :subscription_plans

  has_many :subscriptions

  validates :price, :newspaper, :presence => true
  validates :weekly, :inclusion => [true, false]

  def render_plan_name
  	"#{weekly ? "Weekly" : "Daily"} -- #{price}"
  end
end
