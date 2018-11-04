#Placeholder for a model

class Post < ActiveRecord::Base
  attr_accessor :name, :content

  POSTS = []

  def initalize(details)
    @name = details[:name]
    @content = details[:content]
    POSTS << self
  end

  def self.all
    POSTS
  end

end
