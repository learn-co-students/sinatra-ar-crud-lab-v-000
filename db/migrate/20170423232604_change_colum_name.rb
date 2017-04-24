class ChangeColumName < ActiveRecord::Migration
  def change
      rename_column(:posts, :post_content, :content)
  end
end
