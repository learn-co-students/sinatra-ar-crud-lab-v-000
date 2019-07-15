#Placeholder for a model
require 'pry'
class Article < ActiveRecord::Base
   
  attr_accessor :title, :content
  @@all = []
   
  def initialize(params)
    super
    @title = params[:title] 
    @content = params[:content]
    @@all << self
  end
  
  def self.all 
    @@all
  end
  
  
end