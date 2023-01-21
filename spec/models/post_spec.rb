require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(name: 'Authur')
  subject { Post.new(author: user, title: 'Hello', text: 'This is my first post') }
  before { subject.save }

  context 'When testing provided values before creating a post' do
    it 'Should have a title provided' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'Should have a title less than 250 words' do
      subject.title = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec.'
      expect(subject).to_not be_valid
    end

    it 'Should have a zero or positive comments_counter integer' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'Should have a zero or positive likes_counter integer' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end
  end

  context 'After running the Post\'s model methods' do
    before { 6.times { Comment.create(post: subject, author: user, text: 'Peaky Blinders!') } }

    it 'Should return five_most_recent_comment of a post' do
      expect(subject.five_most_recent_comment.length).to eql 5
    end

    it 'Should update the posts_counter of a user' do
      prev_count = User.find(subject.author_id).posts_counter
      subject.update_posts_counter
      expect(User.find(subject.author_id).posts_counter).to eql prev_count + 1
    end
  end
end
