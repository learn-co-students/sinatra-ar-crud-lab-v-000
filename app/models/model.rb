#Placeholder for a model
class Post < ActiveRecord::Base

  attr_accessor :name, :content

  Posts = []

  def initialize(args)
    @name = args[:name]
    @content = args[:content]
    Posts << self
    #binding.pry
  end

  def self.all
    Posts
  end

end #ends Post model
