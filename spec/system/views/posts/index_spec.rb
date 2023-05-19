require 'rails_helper'

RSpec.describe 'Post#Index', type: :system do
  describe 'The Post#Index page' do
    it 'displays the users profile picture' do
      User.all.each do |user|
        visit user_posts_path(user.id)
        expect(page).to have_css("img[src*='#{user.photo}']")
      end
    end

    it 'displays the username' do
      User.all.each do |user|
        visit user_posts_path(user.id)
        expect(page).to have_content(user.name)
      end
    end

    it 'displays the number of posts' do
      User.all.each do |user|
        visit user_posts_path(user.id)
        expect(page).to have_content(user.posts_counter)
      end
    end

    it 'displays the posts title' do
      User.all.each do |user|
        visit user_posts_path(user.id)
        user.posts.each do |post|
          expect(page).to have_content(post.title)
        end
      end
    end

    it 'displays the posts text' do
      User.all.each do |user|
        visit user_posts_path(user.id)
        user.posts.each do |post|
          expect(page).to have_content(post.text)
        end
      end
    end

    it 'displays the first 3 comments of the first post' do
      User.all.each do |user|
        visit user_posts_path(user.id)
        user.posts.first.comments.take(3).each do |comment|
          expect(page).to have_content(comment.text)
        end
      end
    end

    it 'displays the comments counter' do
      User.all.each do |user|
        visit user_posts_path(user.id)
        user.posts.each do |post|
          expect(page).to have_content(post.comments_counter)
        end
      end
    end

    it 'display the likes counter' do
      User.all.each do |user|
        visit user_posts_path(user.id)
        user.posts.each do |post|
          expect(page).to have_content(post.likes_counter)
        end
      end
    end

    it 'redirects to the post when clicked on' do
      User.all.each do |user|
        visit user_posts_path(user.id)
        user.posts.each do |post|
          click_on post.title
          expect(page).to have_current_path(user_post_path(user.id, post.id))
          visit user_posts_path(user.id)
        end
      end
    end
  end
end
