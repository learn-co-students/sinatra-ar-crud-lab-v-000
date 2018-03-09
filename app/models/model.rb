#Placeholder for a model

class Post < ActiveRecord::Base

  attr_accessor :name, :content

  @@all = []

  def create(data)
    binding.pry
    @name = data[:name]
    @content = data[:content]
    @@all << self
  end

  def all
    @@all
  end
end
