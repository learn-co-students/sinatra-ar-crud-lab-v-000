class CreatePost < ActiveRecord::Migration
  def change
    create_table :posts do |col|
      col.text :name
      col.text :content
    end
  end
end
