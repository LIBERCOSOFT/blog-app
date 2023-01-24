require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/:user_id/posts' do
    subject { User.new(name: 'Authur') }
    before { subject.save }
    before(:each) { get "/users/#{subject.id}/posts" }

    it 'Should return 200 status code' do
      p subject.id
      expect(response).to have_http_status(200)
    end

    it 'Should render the correct template' do
      expect(response).to render_template(:index)
    end

    it 'should render the correct text in the template' do
      expect(response.body).to include 'List of all User\'s post with five most recent comments'
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    subject { User.new(name: 'Authur') }
    before { subject.save }

    it 'Should return 200 status code' do
      post = Post.new(author: subject, title: 'Hello', text: 'This is my first post')
      get "/users/#{subject.id}/posts/#{post.id}"

      expect(response).to have_http_status(200)
    end

    it 'Should render the correct template' do
      post = Post.new(author: subject, title: 'Hello', text: 'This is my first post')
      post.save!
      get "/users/#{subject.id}/posts/#{post.id}"

      expect(response).to render_template(:show)
    end

    it 'should render the correct text in the template' do
      post = Post.new(author: subject, title: 'Hello', text: 'This is my first post')
      post.save!
      get "/users/#{subject.id}/posts/#{post.id}"

      expect(response.body).to include 'A user\'s full post with all comments'
    end
  end
end
