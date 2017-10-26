class RenamePostContentColumn < ActiveRecord::Migration
  def change
    rename_column :posts, :conten, :content
  end
end
