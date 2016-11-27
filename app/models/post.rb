require 'pry'

class Post < ActiveRecord::Base
  attr_accessor :name, :content
  @@all = []

#  def initialize(params)
#    @name = params[:name]
#    @content = params[:content]
#    @@all << self
#    self
#  end

  def self.create(params)
  #  binding.pry
    post = Post.new
    post.name = params[:name]
    post.content = params[:content]
    @@all << post
    post
  end

  def self.all
    @@all
  end

end
