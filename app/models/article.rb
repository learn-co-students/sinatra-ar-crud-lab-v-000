#Placeholder for a model

class Article < ActiveRecord::Base
    validates :title, presence: true
    validates :content, presence: true
end