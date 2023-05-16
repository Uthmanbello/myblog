require 'rails_helper'

RSpec.describe 'User#Index', type: :system do
  describe 'The User#Index page' do
    it 'display all usernames' do
      visit users_path

      User.all.each do |user|
        expect(page).to have_content(user.name)
      end
    end
  end

  describe 'shows the user profile pictures' do
    it 'display all profile pictures' do
      visit users_path

      User.all.each do |user|
        expect(page).to have_css("img[src*='#{user.photo}']")
      end
    end
  end

  describe 'shows the number of posts for each user' do
    it 'display all number of posts' do
      visit users_path

      User.all.each do |user|
        expect(page).to have_content(user.posts_counter)
      end
    end
  end

  describe 'when clicking on a username' do
    it 'redirects to the user profile page on ALL users' do
      visit users_path

      User.all.each do |user|
        click_on user.name
        expect(page).to have_current_path(user_path(user.id))
        visit users_path
      end
    end
  end
end
