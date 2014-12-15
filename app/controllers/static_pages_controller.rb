class StaticPagesController < ApplicationController
  def home
    @post = Post.take(10)
  end
end
