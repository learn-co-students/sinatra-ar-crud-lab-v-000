class Posts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.text :content
  end
end

end
