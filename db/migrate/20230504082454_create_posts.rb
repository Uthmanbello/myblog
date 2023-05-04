# frozen_string_literal: true

# Top-level documentation comment for CreatePosts module
class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.references :user, null: false, index: true, foreign_key: true, name: 'author_id'
      t.integer :comments_counter
      t.integer :likes_counter

      t.timestamps
    end
  end
end
