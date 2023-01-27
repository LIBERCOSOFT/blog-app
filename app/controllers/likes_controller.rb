class LikesController < ApplicationController
  def new
    post = Post.find(params[:post_id])
    new_like = Like.new(author: current_user, post:).update_likes_counter
    if new_like.save
      redirect_to user_posts_path
    else
      flash[:alert] = 'Post can\'t be liked at this time'
    end
  end
end
