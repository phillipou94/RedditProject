class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_hash
      t.integer :karma
      t.boolean :is_admin
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
