#Placeholder for a model

class Article < ActiveRecord::Base
  attr_accessor :title, :content

  ARTICLES = []

  def initialize(args)
     @title = args[:title]
     @content = args[:content]

  end

  def create(params)
    ARTICLES << self.new(params)
  end

  def self.all
    ARTICLES
  end



end
