class RenameUserToSubscriber < ActiveRecord::Migration
  def change
  	remove_index :subscriptions, :user_id
  	add_column :subscriptions, :subscriber_id, :integer
  	add_index :subscriptions, :subscriber_id
  	add_index :subscriptions, [:subscriber_id, :subscription_plan_id], :unique => true
  	remove_index :subscriptions, [:user_id, :subscription_plan_id]
  end
end
