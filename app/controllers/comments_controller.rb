class CommentsController < ApplicationController
	def create
		@new_comment=Comment.new(comment_params)
		if logged_in?
			@new_comment.user = session[:user_id]
			@new_comment.post = params[:id]
    	end 
    	if(@new_comment.save)
      		redirect_to post_path(params[:id])
    	else
      		render new
    	end

	end 


	private
  def comment_params
  	params.require(:comment).permit(:body)
  end
end
