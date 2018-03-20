#Placeholder for a model

class Post < ActiveRecord::Base
  attr_accessor :name, :content

  def initialize
    @name = name
    @content = content
  end
end
