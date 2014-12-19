class AddNameSubreddit < ActiveRecord::Migration
  def change
  	add_column :sub_reddits, :name, :string
  end
end
