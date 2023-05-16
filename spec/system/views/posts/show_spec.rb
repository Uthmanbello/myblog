require 'rails_helper'

RSpec.describe 'Post#Show', type: :system do
  describe 'The Post#Show page' do
    it 'displays the posts title' do
      User.all.each do |user|
        user.posts.each do |post|
          visit user_post_path(user.id, post.id)
          expect(page).to have_content(post.title)
        end
      end
    end

    it 'displays the post author' do
      User.all.each do |user|
        user.posts.each do |post|
          visit user_post_path(user.id, post.id)
          expect(page).to have_content(post.author.name)
        end
      end
    end

    it 'displays the comments counter' do
      User.all.each do |user|
        user.posts.each do |post|
          visit user_post_path(user.id, post.id)
          expect(page).to have_content(post.comments_counter)
        end
      end
    end

    it 'displays the likes counter' do
      User.all.each do |user|
        user.posts.each do |post|
          visit user_post_path(user.id, post.id)
          expect(page).to have_content(post.likes_counter)
        end
      end
    end

    it 'displays the posts text' do
      User.all.each do |user|
        user.posts.each do |post|
          visit user_post_path(user.id, post.id)
          expect(page).to have_content(post.text)
        end
      end
    end

    it 'displays the posts comments' do
      User.all.each do |user|
        user.posts.each do |post|
          visit user_post_path(user.id, post.id)
          post.comments.each do |comment|
            expect(page).to have_content(comment.text)
          end
        end
      end
    end

    it 'displays the comments authors name' do
      User.all.each do |user|
        user.posts.each do |post|
          visit user_post_path(user.id, post.id)
          post.comments.each do |comment|
            expect(page).to have_content(comment.author.name)
          end
        end
      end
    end
  end
end
