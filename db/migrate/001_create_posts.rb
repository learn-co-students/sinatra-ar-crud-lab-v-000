class CreatePosts < ActiveRecord::Migration
  #create the posts table. A blog post should have a name and content.
  def change
    create_table :posts do |t|
      t.string :name
      t.string :content
    end
  end
end
