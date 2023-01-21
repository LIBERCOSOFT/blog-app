require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Authur') }
  before { subject.save }

  context 'When testing provided values before creating a user' do
    it 'Should have a name provided' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'Should have a zero or positive posts_counter integer' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end
  end

  context 'After running the User\'s model methods' do
    before { 5.times { Post.create(author: subject, title: 'Hello', text: 'This is my first post') } }

    it 'Should return three recent post of a user' do
      expect(subject.three_most_recent_posts.length).to eql 3
    end
  end
end
