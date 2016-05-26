class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.text :content
    end
  end
end

# def change
# create_table :dogs do |t|
#   t.string :name
#   t.string :breed
# end
