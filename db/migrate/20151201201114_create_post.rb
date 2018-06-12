class CreatePost < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :ingredients
      t.integer :cook_time
    end
  end
end
