class Post < ActiveRecord::Base
  attr_accessor :name, :content

  POSTS = []

  def initialize(name: 'tom', content: 'something')
    @name = name
    @content = content
    POSTS << self
  end

  def self.all
    POSTS
  end

  def self.clear
    self.all.clear
  end

end
