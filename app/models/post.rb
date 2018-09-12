#Placeholder for a model

class Post < ActiveRecord::Base
  # belongs_to :user

  attr_accessor :name, :content

  @@all = []

  def initialize(params)
    @name = params[:name]
    @content = params[:content]
    @@all << self
  end

end
