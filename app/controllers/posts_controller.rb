class PostsController < ApplicationController
  def new
    @post = current_user.posts.new
  end

  def create
    params.permit!
    @post = current_user.posts.new(post_params)
    @post.save



  end

  def show
    @post = current_user.posts.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
