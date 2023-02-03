class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :author, class_name: 'User'
  after_initialize :set_comments_and_likes_counter_default
  after_save :update_posts_counter

  validates :title, presence: true, length: { in: 1...250 }
  validates :comments_counter, :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_posts_counter
    user = User.find_by_id(author_id)
    user.increment!(:posts_counter)
  end

  def five_most_recent_comment
    Comment.includes(:author).where(post_id: self).order('created_at DESC').first(5)
  end

  def set_comments_and_likes_counter_default
    self.comments_counter = 0 if comments_counter.nil?
    self.likes_counter = 0 if likes_counter.nil?
  end
  private :set_comments_and_likes_counter_default
end
