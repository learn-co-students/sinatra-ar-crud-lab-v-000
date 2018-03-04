class Posts < ActiveRecord::Migration
  def change
     create_table :posts do |table|
        table.string :name
        table.text :content
     end
  end

end
