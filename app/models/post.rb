class Post < ActiveRecord::Base
  validates :name, :content, presence: true
  #attr_accessor :name, :content

  #POSTS = []

  #def initialize(name, content)
  #  @name = name
  #  @content = content
  #  POSTS << self
#  end 

#  def self.all
#    POSTS 
#  end 
end
