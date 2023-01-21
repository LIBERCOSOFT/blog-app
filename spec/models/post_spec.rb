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
      subject.title = 'Consequat nulla incididunt in ut nulla irure est aliquip labore pariatur. Voluptate est officia ad velit. Quis in ex id consequat sunt laboris nostrud officia. Duis Lorem culpa irure adipisicing aliqua excepteur cillum non magna deserunt fugiat. Reprehenderit non incididunt duis duis enim ullamco enim ex.Ex eiusmod sit aute ex aute consectetur non consequat. Esse aliquip proident reprehenderit ut sint commodo. Qui ipsum anim incididunt nisi exercitation veniam et incididunt elit. Velit commodo nulla enim aute mollit est nisi commodo sit laboris Lorem quis aute voluptate. Elit sunt velit incididunt aute sunt dolore et velit id. Ad proident ullamco culpa anim cillum consectetur qui occaecat.'
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
