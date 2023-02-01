class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments
  has_many :posts
  has_many :likes
  after_initialize :set_posts_counter_default

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def three_most_recent_posts
    Post.where(author_id: self).order('created_at DESC').first(3)
  end

  def set_posts_counter_default
    self.posts_counter = 0 if posts_counter.nil?
  end
  private :set_posts_counter_default
end
