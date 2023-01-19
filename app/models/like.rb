class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def self.update_likes_counter(post_id)
    post = Post.find_by_id(post_id)
    post.increment!(:likes_counter)
  end
end
