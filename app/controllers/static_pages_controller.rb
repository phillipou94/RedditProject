class StaticPagesController < ApplicationController
  def home
    @posts = Post.take(100)
  end
end
