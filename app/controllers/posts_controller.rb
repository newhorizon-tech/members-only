class PostsController < ApplicationController
  def new
    @post = current_user.posts.new
  end

  def create
    params.permit!
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end






  end

  def show
    @post = current_user.posts.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
