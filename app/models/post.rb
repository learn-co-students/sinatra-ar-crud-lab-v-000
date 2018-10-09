#Placeholder for a model

class Post < ActiveRecord::Base
  has_many :names
  has_many :contents
end
