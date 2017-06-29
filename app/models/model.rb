class Post
  attr_accessor :name, :content

  POSTS = []

  def initialize(name, content)
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
