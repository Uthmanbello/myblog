# frozen_string_literal: true

# Top-level documentation comment for RenamePhotoUrlToPhotoInUsers module
class RenamePhotoUrlToPhotoInUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :photo_url, :photo
  end
end
