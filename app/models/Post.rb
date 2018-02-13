class Post < ActiveRecord::Base

attr_accessor :name, :content

  def initialize(args)
    @name = args[:name]
    @content = args[:content]
  end

end
