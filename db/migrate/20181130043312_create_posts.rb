class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :blog_posts do |t|
      t.string :name
      t.string :content

    end
  end
end