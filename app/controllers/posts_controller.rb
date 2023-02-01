class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.includes(:comments).where(author_id: params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = Comment.includes(:author).where(post_id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    new_post = Post.new(author: current_user, title: params[:post][:title], text: params[:post][:text])
    if new_post.save
      redirect_to user_posts_path
    else
      render :new
    end
  end
end
