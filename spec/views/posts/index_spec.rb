require 'rails_helper'

RSpec.describe 'User Details Page', type: :system do
  describe 'show page' do
    before(:each) do
      @user_one = User.create(name: 'Thomas', photo: 'https://cf.shopee.ph/file/addd63d9096e591237f4a80b42b52979', bio: 'Mob from Small Heath')
      @post_one = Post.create(author: @user_one, title: 'Hello One', text: 'This is my first post')
      @comment_one = Comment.create(author: @user_one, post: @post_one, text: 'This is a sample text')
    end

    it 'shows the profile picture of a selected user' do
      visit user_posts_path(@user_one.id)
      expect(page).to have_css('.user_container div img')
      expect(page).to have_css("img[src='https://cf.shopee.ph/file/addd63d9096e591237f4a80b42b52979']")
    end

    it 'shows the user\'s name' do
      visit user_posts_path(@user_one.id)
      expect(page).to have_content(@user_one.name)
    end

    it 'shows the number of posts for the user' do
      visit user_posts_path(@user_one.id)
      expect(page).to have_content('Number of posts:')
      expect(page).to have_content(@user_one.posts_counter)
    end

    it 'shows the title of a post' do
      visit user_posts_path(@user_one.id)
      expect(page).to have_content(@post_one.title)
    end

    it 'shows the body of a post' do
      visit user_posts_path(@user_one.id)
      expect(page).to have_content(@post_one.text)
    end

    it 'shows the first comment of a post' do
      visit user_posts_path(@user_one.id)
      expect(page).to have_content(@comment_one.text)
    end

    it 'shows the number of comment for a post' do
      visit user_posts_path(@user_one.id)
      expect(page).to have_content('Comments:')
      expect(page).to have_content(@post_one.comments_counter)
    end

    it 'shows the number of like for a post' do
      visit user_posts_path(@user_one.id)
      expect(page).to have_content('Likes:')
      expect(page).to have_content(@post_one.likes_counter)
    end

    it 'shows the button to see more user\'s post ' do
      visit user_posts_path(@user_one.id)
      expect(page).to have_content('Pagination')
    end

    it 'redirects to a post\'s details page' do
      visit user_posts_path(@user_one.id)
      click_on @post_one.title
      expect(page).to have_current_path user_post_path(@user_one.id, @post_one.id)
    end
  end
end
