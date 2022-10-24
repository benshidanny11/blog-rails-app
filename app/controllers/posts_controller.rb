class PostsController < ApplicationController
  def index
    #@posts = Post.all
    @user = User.find(params[:user_id])
    @posts = Post.where(user_id: params[@user.id])

  end

  def show
    @post = Post.find(params[:id])
  end
end
