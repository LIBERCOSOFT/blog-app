require 'rails_helper'

RSpec.describe 'User Page', type: :system do
  describe 'index page' do
    before(:each) do
      @user_one = User.create(name: 'Thomas', photo: 'https://cf.shopee.ph/file/addd63d9096e591237f4a80b42b52979')
      @user_two = User.create(name: 'Polly', photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYkbpibWnxXGEOHY7OJNsVhPWPhtp4UTTLiP9mzxavaJWM43-BPm_f46GvSGexphkvuvU&usqp=CAU')
    end

    it 'shows the list of all users' do
      visit users_path
      expect(page).to have_content('Thomas')
      expect(page).to have_content('Polly')
    end

    it 'shows the images for each user' do
      visit users_path
      expect(page).to have_css('.user_container div img')
      expect(page).to have_css("img[src='https://cf.shopee.ph/file/addd63d9096e591237f4a80b42b52979']")
      expect(page).to have_css("img[src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYkbpibWnxXGEOHY7OJNsVhPWPhtp4UTTLiP9mzxavaJWM43-BPm_f46GvSGexphkvuvU&usqp=CAU']")
    end

    it 'shows the number of posts for each user' do
      visit users_path
      expect(page).to have_content("Number of posts: #{@user_one.posts_counter}")
      expect(page).to have_content("Number of posts: #{@user_two.posts_counter}")
    end

    it 'redirects to user\s details page' do
      visit users_path
      click_on @user_one.name.to_s
      expect(page).to have_current_path user_path(@user_one.id)
    end
  end
end
