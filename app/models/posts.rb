class Post < ActiveRecord::Base
  attr_accessor :name, :content
  @@all = []

  def initialize(params)
    @name = params[:name]
    @content = params[:content]
    @@all << self
  end

  def self.all
    @@all
  end

  def self.clear
    @@all.clear
  end

end
