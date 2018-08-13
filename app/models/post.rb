#Placeholder for a model

class Post < ActiveRecord::Base
  attr_accessor :name, :content

 ALL = []
  def initialize(params)
    @name = params[:name]
    @content = params[:content]
  end

  def self.all
    ALL 
  end
end