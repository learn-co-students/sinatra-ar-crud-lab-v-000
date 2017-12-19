class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|  #pluralized for table
      t.string :name
      t.string :breed
    end
  end
end
