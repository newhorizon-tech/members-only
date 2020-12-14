class PostsController < ApplicationController
  def new
    if user_signed_in?
     @post = current_user.posts.new
    else
     flash.alert ="Please log in to create a new post"
     redirect_to new_user_session_path
    end
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
