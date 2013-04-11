class CreateSubscriptionPlans < ActiveRecord::Migration
  def change
    create_table :subscription_plans do |t|
      t.integer :price
      t.boolean :weekly
      t.references :newspaper

      t.timestamps
    end
    add_index :subscription_plans, :newspaper_id
  end
end
