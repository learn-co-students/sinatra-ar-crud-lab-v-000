class Fixcolumnname < ActiveRecord::Migration
  def up
    add_column :posts, :content, :text
  end

  def down
    remove_column :posts, :context, :text
  end
end
