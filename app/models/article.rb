#Placeholder for a model

class Article < ActiveRecord::Base
  attr_accessor :title, :content

  ARTICLES = []

  def initialize(args)
     @title = args[:title]
     @content = args[:content]
    ARTICLES << self
  end

end
