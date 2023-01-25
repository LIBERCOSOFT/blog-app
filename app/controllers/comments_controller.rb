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
end
