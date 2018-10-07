#Placeholder for a model

class Post < ActiveRecord::Base

  attr_reader :name, :content

  def initialize(params)
    @name = params[:name]
    @content = params[:content]
  end
end
