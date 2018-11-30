class CreateArticles < ActiveRecord::Migration[5.1]
    def change
      create_table :articles do |a|
        a.string :name
        a.string :content

      end
    end

end
