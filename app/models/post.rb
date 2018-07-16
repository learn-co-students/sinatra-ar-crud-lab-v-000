
# these methods should all be default to ActiveRecord

class Post < ActiveRecord::Base

=begin
  attr_accessor :name, :content
  POSTS = []

  def initialize(name, content)
    self.name = name
    self.content = content
  end

  def self.create(name:, content:)
    POSTS << new(name, content)
    last
  end

  def self.all
    POSTS
  end

  def self.last
    all[-1]
  end
=end

end
