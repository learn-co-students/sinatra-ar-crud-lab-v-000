class Post < ActiveRecord::Base

  # @@posts = []
  #
  # def initialize(arguments)
  #   arguments.each {|key, value| self.send(("#{key}"=), value)}
  # end
  #
  # def self.create(arguments)
  #   self.new(arguments)
  #   @@posts << self
  # end
  #
  # def self.all
  #   @@posts
  # end
end
