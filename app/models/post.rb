require 'pry'

class Post < ActiveRecord::Base
  attr_accessor :name, :content
  ALL = []

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
    ALL << post
    #binding.pry
    post
  end

  def self.all
    ALL
  end

end
