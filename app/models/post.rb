class Post < ActiveRecord::Base

  def self.newest_post
    Post.order(id: :desc).limit(1)[0]
  end

  def self.all_other_posts
    Post.order(id: :desc).offset(1)
  end
end
