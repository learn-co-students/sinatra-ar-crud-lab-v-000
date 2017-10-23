require 'pry'
class Post < ActiveRecord::Base

#This class inherits all its needed methods from ActiveRecord::Base,
#and its attr_accessor fields from my table migration. Therefore the code
#below is unneeded and commented out.

#  attr_accessor :name, :content

#  POSTS = []

#  def initialize(params)
#    @name = params[:name]
#    @content = params[:content]
#    POSTS << self
#    binding.pry
#  end

#  def self.all
#    POSTS
#  end

end
