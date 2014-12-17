class PostsController < ApplicationController
  def new
    redirect_to root_path if !logged_in?
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
    #for testing only
    if logged_in?
      @post.user_id= session[:user_id]
    end
    if(@post.save)
      redirect_to root_path
    else
      render new
      flash[:danger] = "Please Make a Valid Post"
    end
  end

  def show
    @post = Post.find(params[:id])
    #@comment = Comment.find([post_id: params[:id]])
    @comment = Comment.includes(:user).where("post_id = ?", params[:id])


  end

  private
  def post_params
  	params.require(:post).permit(:body, :title)
  end




end
