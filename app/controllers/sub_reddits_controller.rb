class SubRedditsController < ApplicationController


	def create
  	@sub_reddit = SubReddit.new(page_params)
  	if(@sub_reddit.save)
      	redirect_to root_path	
    end
  end 

  def show
  		#@page = SubReddit.where("name = ?", params[:name])
  	@page = SubReddit.find(params[:id])
    @posts = Post.where("sub_reddit_id = ? ", params[:id])
  end

  def index
    @all_pages=SubReddit.all
  end


  private

  def page_params
		params.require(:sub_reddit).permit(:name) 	#only allow injection to these fields
	end

end
