#Placeholder for a model
class Posts < ActiveRecord::Base
# will it need a relationship? Posts belong_to an author 
# AR, so it can't have attr_accessors, or initialize
#create
#save

  def create(name, content)
    @name = name
    @content = content
  end

  def self.save

  end

end
