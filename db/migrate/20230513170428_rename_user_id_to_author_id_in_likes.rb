# frozen_string_literal: true

# Top-level documentation comment for RenameUserIdToAuthorIdInLikes module
class RenameUserIdToAuthorIdInLikes < ActiveRecord::Migration[7.0]
  def change
    rename_column :likes, :user_id, :author_id
  end
end
