#Placeholder for a model

class Post < ActiveRecord::Base

  attr_accessor :id, :name, :content

  POSTS = []

  def initialize(name, content)
    @name = name
    @content = content
    POSTS << self
  end

  def self.create(name:, content:)
    self.new(:name, :content)
  end

  def self.all
    POSTS
  end

end
