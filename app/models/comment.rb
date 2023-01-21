class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_comments_counter
    post = Post.find_by_id(post_id)
    post.increment!(:comments_counter)
  end
end
