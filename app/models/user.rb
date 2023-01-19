class User < ApplicationRecord
  has_many :comments
  has_many :posts
  has_many :likes

  def self.three_most_recent_posts(author_id)
    Post.where("author_id = #{author_id}").order('created_at DESC').first(3)
  end
end
