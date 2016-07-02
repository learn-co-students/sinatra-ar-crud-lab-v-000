class Post < ActiveRecord::Base

  attr_accessor :name, :content 

@@all = []

  def initialize(name, content)
    @name = name
    @content = content 
    self << @@all 
  end

  def self.all
    @@all 
  end 

end