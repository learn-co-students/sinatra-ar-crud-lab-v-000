#Placeholder for a model
require 'pry'
class Post < ActiveRecord::Base
  attr_accessor :name, :content

  POSTS = []

  def initialize(params)
    @name = params[:name]
    @content = params[:content]
    #binding.pry
    POSTS << self
    binding.pry
  end

  #def self.all
  #  POSTS
#  end
end
