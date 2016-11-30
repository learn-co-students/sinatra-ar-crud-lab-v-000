require 'pry'

class Post < ActiveRecord::Base
  attr_accessor :name, :content
  ALL = []

  def self.create(params)
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
