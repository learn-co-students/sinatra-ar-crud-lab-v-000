#Placeholder for a model

class Post < ActiveRecord::Base
  def change
    create_table :posts do |t|
      t.string :name
      t.string :content
    end
  end
end