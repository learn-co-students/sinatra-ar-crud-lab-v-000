require 'pry'

class Post < ActiveRecord::Base
  attr_accessor :name, :content

  #@@posts = []

  def initialize(params)
    #binding.pry
    @name = params[:name]
    @content = params[:content]
   # @@posts << self
  end

  def self.all 
    @@posts
  end


end