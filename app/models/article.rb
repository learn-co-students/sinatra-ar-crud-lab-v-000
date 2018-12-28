
class Article < ActiveRecord::Base
  attr_accessor :title, :content
 
  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
  end
end