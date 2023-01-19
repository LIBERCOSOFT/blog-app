class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User'

  def self.update_posts_counter(author_id)
    user = User.find_by_id(author_id)
    user.increment!(:posts_counter)
  end

  def self.five_most_recent_comment(post_id)
    Comment.where("post_id = #{post_id}").order('created_at DESC').first(5)
  end
end
