# frozen_string_literal: true

# Top-level documentation comment for RemoveUserIdFromPosts module
class RemoveUserIdFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :user_id, :bigint
  end
end
