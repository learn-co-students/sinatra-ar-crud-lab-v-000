#Placeholder for a model

class Article < ActiveRecord::Base
  
  attr_accessor :title, :content
  
  @@all = []
  
  def initialize(title, content)
    @title= title
    @content= content
    @@all << self
  end
  
end