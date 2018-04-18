#Placeholder for a model

class Post < ActiveRecord::Base
=begin
  attr_reader :name, :content
  POSTS = []

  def initialize(params)
    @name = name
    @content = content
    POSTS << self
  end

  def self.all
    POSTS
  end

  def self.clear
    POSTS.clear
  end
=end
end
