#Placeholder for a model
class Post < ActiveRecord::Base

end


# class CreatePosts < ActiveRecord::Migration
#   def change
#     create_table :posts do |t|
#       t.string :name
#       t.string :content
#     end
#   end
# end

# sqlite3 students_database.db #create a database
# sqlite3 students_database.db < create.sql #shovel in the create sql file
# sqlite3 students_database.db < insert.sql #shovel in the insert sql file
# sqlite3 students_database.db # load it up again
# SELECT * FROM students #start terminal from sqlite> section
# .header on
# .mode column
