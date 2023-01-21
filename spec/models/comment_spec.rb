require 'rails_helper'

RSpec.describe Comment, type: :model do
  author = User.create(name: 'Authur')
  post = Post.create(author:, title: 'Hello', text: 'This is my first post')
  subject { Comment.new(author:, post:, text: 'Order of the f**king peaky blinders') }

  before { subject.save }

  context 'When running comment\'s methods' do
    it 'Should update comments_counter of a post' do
      prev_comments_counter = Post.find(subject.post_id).comments_counter
      subject.update_comments_counter
      expect(Post.find(subject.post_id).comments_counter).to eql prev_comments_counter + 1
    end
  end
end
