class CreateArticles < ActiveRecord::Base
  def change
    create_table :articles do |t|
      t.string :title
      t.string :content

    end
  end
end
