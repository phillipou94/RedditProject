class RelationshipsController < ApplicationController

	def create
		page = SubReddit.find(params[:followed_id])
    	current_user.follow(page)
    	redirect_to page
	end

	def destroy
		page = Relationship.find(params[:id]).followed
    	current_user.unfollow(page)
    	redirect_to page
	end 


end
