
class Post < ActiveRecord::Base
  def change
    create_table do |t|
      t.string name
      t.string content
    end
  end
end
