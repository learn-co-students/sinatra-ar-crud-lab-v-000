class CreatePost < ActiveRecord::Migration
  def change
    create_table :posts do |p|
    p.string  :post_name
    p.string :post_content
    end
  end
  
end
