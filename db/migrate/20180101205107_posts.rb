class Posts < ActiveRecord::Migration[4.2]
  def change
    create_table :posts do |p|
      p.string :name
      p.string :content
    end
  end
end
