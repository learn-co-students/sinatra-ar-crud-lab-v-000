class CreateArticles < ActiveRecord::Migration[5.1]
  def change

    def up
      t.string :title
      t.string :content
    end

    def down
      drop_table :articles
    end

end
