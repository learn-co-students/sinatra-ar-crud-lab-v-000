#Placeholder for a model

class Article < ActiveRecord::Base
<<<<<<< HEAD
  # attr_accessor :title, :content
  #
  # ARTICLES = []

  # def initialize(args)
  #    @title = args[:title]
  #    @content = args[:content]
  # end
  #
  # def self.create(params)
  #   ARTICLES << Self.new(params)
  #     binding.pry
  # end
  #
  # def self.all
  #   ARTICLES
  # end
=======
  attr_accessor :title, :content

  ARTICLES = []

  def initialize(args)
     @title = args[:title]
     @content = args[:content]

  end

  def self.create(params)
    binding.pry
    ARTICLES << self.new(params)
  end

  def self.all
    ARTICLES
  end



>>>>>>> cf5917ec1093f97279d3805f91a58da081b9627f
end
