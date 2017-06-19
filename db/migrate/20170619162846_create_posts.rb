class CreatePosts < ActiveRecord::Migration
def change
create_table :posts do |table|
                        table.text :name
                        table.text :content
                        table.timestamps
                      end
end#eom
end
