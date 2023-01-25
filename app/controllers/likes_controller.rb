class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    new_like = Like.new(author: current_user, post:).update_likes_counter
    if new_like.save
      redirect_to "/users/#{current_user.id}/posts", notice: 'Successfully Liked'
    else
      flash[:alert] = 'Post can\'t be liked at this time'
    end
  end
end
