class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :subscription_plan
      t.references :user

      t.timestamps
    end
    add_index :subscriptions, :subscription_plan_id
    add_index :subscriptions, :user_id
    add_index :subscriptions, [:user_id, :subscription_plan_id], :unique => true
  end
end
