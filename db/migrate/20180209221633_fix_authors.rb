class FixAuthors < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :author_name
    add_column :posts, :author_id, :integer

    create_table :authors do |t|
      t.string :name
    end
  end
end
