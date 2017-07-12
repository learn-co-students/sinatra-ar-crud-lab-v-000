class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |table|
      table.column :name, :string
      table.column :content, :text
    end
  end
end
