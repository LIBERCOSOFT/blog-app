class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    new_comment = Comment.new(post: Post.find(params[:post_id]), author: current_user, text: params[:comment][:text])
    if new_comment.save
      redirect_to "/users/#{current_user.id}/posts", notice: 'Successfully commented'
    else
      render :new
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    comment = Comment.find(params[:id])
    post.comments_counter -= 1
    comment.destroy
    post.save
    redirect_to user_post_path(params[:user_id], params[:post_id])
  end
end
