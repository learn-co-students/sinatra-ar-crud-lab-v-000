class Post < ActiveRecord::Base
  def create(name:,content:)
    @name = :name
    @content = :content
    self.save
  end
end
