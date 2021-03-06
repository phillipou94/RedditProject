class VotesController < ApplicationController
  def new
  end

  def create
  	if !logged_in?
  		redirect_to login_path
  	else

  	end 
  end 
  
  def upvote
  	if !logged_in?
  		redirect_to login_path
      flash[:danger]="Please sign in to vote"
  	else	#create vote
  		@vote = Vote.new
  		@vote.post = Post.find(params[:post_id])
  		@vote.user = User.find(session[:user_id])
  		@vote.is_upvote=true
  		@vote.save
      respond_to do |format|
        format.html { redirect_to root_url }
        format.js
      end
  	end 
  end 

  def downvote
  	if !logged_in?
  		redirect_to login_path
      flash[:danger]="Please sign in to vote"
  	else	#create vote
  		@vote = Vote.new
  		@vote.post = Post.find(params[:post_id])
  		@vote.user = User.find(session[:user_id])
  		@vote.is_upvote=false
  		@vote.save
      respond_to do |format|
        format.html { redirect_to root_url }
        format.js
      end
  	end 
  end 

end
