class SubReddit < ActiveRecord::Base
	has_many :post
	has_many :following, through: :active_relationships, source: :followed
end
