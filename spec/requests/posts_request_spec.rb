require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/:user_id/posts' do
    before(:each) { get '/users/:user_id/posts' }

    it 'Should return 200 status code' do
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
    before(:each) { get '/users/:user_id/posts/:id' }

    it 'Should return 200 status code' do
      expect(response).to have_http_status(200)
    end

    it 'Should render the correct template' do
      expect(response).to render_template(:show)
    end

    it 'should render the correct text in the template' do
      expect(response.body).to include 'A user\'s full post with all comments'
    end
  end
end
