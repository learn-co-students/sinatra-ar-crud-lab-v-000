class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    Article.reset_column_information
    create_table :articles do |t|
      t.string :title
      t.string :content
    end
  end
end
