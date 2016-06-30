class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |x|
      x.string :name
      x.string :content
    end
  end
end