# frozen_string_literal: true

# Top-level documentation comment for RenameUserIdToAuthorIdInComments module
class RenameUserIdToAuthorIdInComments < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :user_id, :author_id
  end
end
