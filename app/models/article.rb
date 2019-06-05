#Placeholder for a model

class Article < ActiveRecord::Base
  
  attr_accessor :title, :content 
  
  def initialize(arg={}) 
    @title = arg[:title] 
    @content = arg[:content]
  end 
    
end