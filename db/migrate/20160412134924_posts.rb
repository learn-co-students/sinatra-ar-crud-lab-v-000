class Posts < ActiveRecord::Migration
  def change
    create_table "posts", force: :cascade do |t|
      t.string "name"
      t.string "content"
    end
  end
end
