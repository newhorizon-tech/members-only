class PostsController < ApplicationController
  before_action :require_sign_in

  def new
      @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def require_sign_in
    unless user_signed_in?     
      flash.alert = 'Please log in to create a new post'
      redirect_to new_user_session_path
    end
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
