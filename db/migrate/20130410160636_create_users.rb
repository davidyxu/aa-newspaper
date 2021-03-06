class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password_digest
      t.string :name
      t.string :email

      t.timestamps
    end
    add_index :users, :email, :unique => true
  end
end
