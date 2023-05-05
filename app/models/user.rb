# Top-level documentation comment for User module
class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  def recent_posts(num)
    posts.order(created_at: :desc).limit(num)
  end
end
