class Post < ActiveRecord::Base

  def self.create(name:, content:)
    @post = Post.new
    @post.name = name
    @post.content = content
    @post.save
    @post
  end

end
