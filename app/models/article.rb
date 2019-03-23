#Placeholder for a model

class Article < ActiveRecord::Base
  attr_accessor :title, :content

  @@all = []

  def initialize(title, content)
    @title = params[:title]
    @content = params[:content]
  end

  def self.create
    @@all << self
  end

  def self.all
    @@all
  end
end
