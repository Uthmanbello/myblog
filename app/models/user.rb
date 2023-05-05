# frozen_string_literal: true

# Top-level documentation comment for User module
class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  def recent_posts(num)
    posts.order(created_at: :desc).limit(num)
  end
end
