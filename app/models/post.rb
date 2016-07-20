class Post < ActiveRecord::Base
  attr_accessor :name, :content
  @@all = []

  # def initialize(attributes)
  #   attributes.each {|key, value| self.send(("#{key}="), value)}
  #   @@all << self
  # end

  def self.all
    @@all
  end
end
