class CreatePost < ActiveRecord::Migration
  def change
    create_table :posts do |t| #from dog example in activerecord setup in sinatra
      t.string :name
      t.string :content
    end
  end
end
