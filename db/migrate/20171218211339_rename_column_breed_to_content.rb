class RenameColumnBreedToContent < ActiveRecord::Migration
  def change
    rename_column :posts, :breed, :content
  end
end
