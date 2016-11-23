class Post < ActiveRecord::Base
  @@deleted = []

  def add_to_deleted
    @@deleted << self
  end

  def self.deleted
    @@deleted
  end

end
