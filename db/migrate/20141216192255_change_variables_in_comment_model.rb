class ChangeVariablesInCommentModel < ActiveRecord::Migration
  def change
  	remove_column :comments, :user
  	remove_column :comments, :post
  	add_column :comments, :user_id, :string
  	add_column :comments, :post_id, :string

  end
end
