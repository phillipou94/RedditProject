class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :post
      t.string :references
      t.string :user
      t.string :references
      t.text :body

      t.timestamps null: false
    end
  end
end
