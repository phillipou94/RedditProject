class AddSubRedditIdToPost < ActiveRecord::Migration
  def change
  	add_column :post, :sub_reddit_id, :string
  end
end
