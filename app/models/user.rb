class User < ApplicationRecord
  has_many :comments
  has_many :posts
  has_many :likes

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.three_most_recent_posts(author_id)
    Post.where("author_id = #{author_id}").order('created_at DESC').first(3)
  end
end
