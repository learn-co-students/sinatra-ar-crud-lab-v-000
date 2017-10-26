class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.string :name
      t.string :conten
    end
  end

  def down
    drop_table :posts
  end

end  #  End of Class
