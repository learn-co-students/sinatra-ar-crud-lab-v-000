class Createpost < ActiveRecord::Migration
  def change
    create_table :Posts do |t|
    t.string :name
    t.text :content
    end 
  end
end
