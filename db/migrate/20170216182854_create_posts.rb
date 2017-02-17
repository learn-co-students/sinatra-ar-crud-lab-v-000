class CreatePosts < ActiveRecord::Migration
  
  def change
    create_table :posts do |c|
      c.string :name
      c.string :content
    end
  end


end
