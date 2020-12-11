class PostsController < ApplicationController
  def new
  end

  def create
    @post = current_user.posts.new(params[:post])
  end

  def show
    @post = current_user.posts.find(params[:id])
  end

end
