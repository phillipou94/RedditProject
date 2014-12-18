class Post < ActiveRecord::Base
	belongs_to :user
	has_many :vote
	has_many :comment
	#VALID_URL_REGEX = /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix
	validates :user_id, presence: true #, format: { with: VALID_URL_REGEX }

	def karma
		karma=0
		vote_collection = Vote.where("post_id = ?", self.id)	#returning array of votes
		vote_collection.each do |vote|
			if vote.is_upvote
				karma +=1
			else
				karma -=1
			end
		end 
		karma
	end 

end
