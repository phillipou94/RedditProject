class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :body
      t.string :post_id
      t.string :integer
      t.string :image
      t.string :link
      t.timestamps null: false
    end
  end
end
