require 'rails_helper'

RSpec.describe Like, type: :model do
  author = User.create(name: 'Authur')
  post = Post.create(author:, title: 'Hello', text: 'This is my first post')
  subject { Like.new(author:, post:) }

  before { subject.save }

  context 'When running like\'s methods' do
    it 'Should update comments_counter of a post' do
      prev_likes_counter = Post.find(subject.post_id).likes_counter
      subject.update_likes_counter
      expect(Post.find(subject.post_id).likes_counter).to eql prev_likes_counter + 1
    end
  end
end
