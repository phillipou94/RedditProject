class PostsController < ApplicationController
  def new
  	@post = Post.new 
  end

  def create
  	@post = Post.new(post_params)
    #for testing only
    @post.user_id=1
    if(@post.save)
      redirect_to root_path
    else 
      render new
    end
  end

  private
  def post_params
  	params.require(:post).permit(:body,:link, :title)
  end




end
