class CreatePosts < ActiveRecord::Migration
  def change
    create_table :Posts do |t|
      t.string :name
      t.string :content
    end
  end
end
