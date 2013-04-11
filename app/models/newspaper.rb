class Newspaper < ActiveRecord::Base
  attr_accessible :editor, :title, :subscription_plans_attributes

  has_many :subscription_plans, :inverse_of => :newspaper
  has_many :subscribers, :through => :subscription_plans
  validates :title, :presence => true

  accepts_nested_attributes_for :subscription_plans,
  															:reject_if => lambda { |plan| plan[:weekly].blank? || plan[:price].blank?}
end
