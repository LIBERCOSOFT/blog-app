require 'rails_helper'

RSpec.describe 'User Details Page', type: :system do
  describe 'show page' do
    before(:each) do
      @user_one = User.create(name: 'Thomas', photo: 'https://cf.shopee.ph/file/addd63d9096e591237f4a80b42b52979', bio: 'Mob from Small Heath')
      @post_one = Post.create(author: @user_one, title: 'Hello One', text: 'This is my first post')
      @post_two = Post.create(author: @user_one, title: 'Hello Two', text: 'This is my second post')
      @post_three = Post.create(author: @user_one, title: 'Hello Three', text: 'This is my third post')
    end

    it 'shows the profile picture of a selected user' do
      visit user_path(@user_one.id)
      expect(page).to have_css('.user_container div img')
      expect(page).to have_css("img[src='https://cf.shopee.ph/file/addd63d9096e591237f4a80b42b52979']")
    end

    it 'shows the user\'s name' do
      visit user_path(@user_one.id)
      expect(page).to have_content(@user_one.name)
    end

    it 'shows the number of posts for the user' do
      visit user_path(@user_one.id)
      expect(page).to have_content('Number of posts:')
      expect(page).to have_content(@user_one.posts_counter)
    end

    it 'shows the bio of the user' do
      visit user_path(@user_one.id)
      expect(page).to have_content('Bio')
      expect(page).to have_content(@user_one.bio)
    end

    it 'shows the three recent post of the user' do
      visit user_path(@user_one.id)
      expect(page).to have_content(@post_one.title)
      expect(page).to have_content(@post_two.title)
      expect(page).to have_content(@post_three.title)
    end

    it 'shows the button to see all user\'s post ' do
      visit user_path(@user_one.id)
      expect(page).to have_content('See all posts')
    end

    it 'redirects to post\'s details page' do
      visit user_path(@user_one.id)
      click_on @post_one.title.to_s
      expect(page).to have_current_path user_post_path(@user_one.id, @post_one.id)
    end

    it 'redirects to all post\'s for a user page' do
      visit user_path(@user_one.id)
      click_on 'See all posts'
      expect(page).to have_current_path user_posts_path(@user_one.id)
    end
  end
end
