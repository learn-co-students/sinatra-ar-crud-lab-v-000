class RenameColumn < ActiveRecord::Migration
  def change
    rename_column(:posts,:post_name, :name)
  end
end
