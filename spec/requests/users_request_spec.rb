require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /user' do
    before(:each) { get '/users' }

    it 'Should return 200 status code' do
      expect(response).to have_http_status(200)
    end

    it 'Should render the correct template' do
      expect(response).to render_template(:index)
    end

    it 'should render the correct text in the template' do
      expect(response.body).to include 'List of all Users with their number of posts only'
    end
  end

  describe 'GET /user/:id' do
    before(:each) { get '/users/:id' }

    it 'Should return 200 status code' do
      expect(response).to have_http_status(200)
    end

    it 'Should render the correct template' do
      expect(response).to render_template(:show)
    end

    it 'should render the correct text in the template' do
      expect(response.body).to include 'A user\'s bio with summerised list of three most recent posts'
    end
  end
end
