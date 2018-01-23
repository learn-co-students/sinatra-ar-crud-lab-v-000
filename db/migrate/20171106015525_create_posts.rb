class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |post|
      post.string :name
      post.string :content
    end
  end
end
