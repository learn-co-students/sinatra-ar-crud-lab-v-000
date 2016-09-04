class Post < ActiveRecord::Base

  attr_accessor :name, :content
  @@posts = []

  def initialize(name:, content:)
    @name = name
    @content = content
    @@posts << self
  end

  def self.all
    @@posts
  end

end