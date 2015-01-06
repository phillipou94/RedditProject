class User < ActiveRecord::Base
	attr_accessor :remember_token
	has_many :post
	has_many :vote
	has_many :comments
	has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy



	before_save { self.email = email.downcase }
	validates :name, presence: true, length: {maximum:50}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: {maximum: 255}, 
										format: {with:VALID_EMAIL_REGEX} , 
											uniqueness: {case_sensitive:false}
	has_secure_password
	validates :password, length: {minimum:6}

	def User.new_token
		SecureRandom.urlsafe_base64 #creates a random token
	end

	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end 

	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end 

	def authenticated?(remember_token)
		return false if remember_digest.nil?
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end

	def forget 
		update_attribute(:remember_digest,nil)
	end


	# Follows a subreddit.
  	def follow(sub_reddit)
    	active_relationships.create(followed_id: sub_reddit.id)
  	end

  # Unfollows a sub_reddit.
  	def unfollow(sub_reddit)
    	active_relationships.find_by(followed_id: sub_reddit.id).destroy
  	end

  # Returns true if the current user is following the subreddit.
  	def following?(sub_reddit)
    	#active_relationships.following.include?(sub_reddit)
    	active_relationships.exists?(:followed_id => sub_reddit.id)
  	end


end
