class Post < ActiveRecord::Base
	belongs_to :user
	has_many :vote
	has_many :comment
	validates :user_id, presence: true
end
