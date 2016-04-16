class Post < ActiveRecord::Base
  attr_accessor :name, :content

  POSTS = []

  def initialize(args)
    @name = args[:name]
    @content = args[:content]
  end

  def self.create(args)
    Post.new(args)
    self.save
    POSTS << self
  end

  def self.all
    POSTS
  end
end