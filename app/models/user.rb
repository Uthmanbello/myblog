class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  def recent_posts(n)
    posts.order(created_at: :desc).limit(n)
  end
end
