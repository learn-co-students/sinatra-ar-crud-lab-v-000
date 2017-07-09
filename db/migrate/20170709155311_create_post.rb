class CreatePost < ActiveRecord::Migration
  def change
    create_table :post do |t|
      t.string :name
      t.string :content
    end
  end
end
