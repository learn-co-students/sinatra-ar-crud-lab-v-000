class ChangeContentFormatInTable < ActiveRecord::Migration
  def change
    change_column :posts, :content, :string
  end
end
