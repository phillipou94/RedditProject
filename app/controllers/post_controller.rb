class PostController < ApplicationController
  def new
  	@post = Post.new 
  end

  def create
  	@post = Post.new(post_params)
  end

  private
  def post_params
  	params.require(:post).permit(:body,:link, :title)
  end




end
