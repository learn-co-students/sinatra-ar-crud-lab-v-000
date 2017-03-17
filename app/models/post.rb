class Post < ActiveRecord::Base

  # attr_accessor :name, :content, :id
  #
  # @@all = []
  #
  # def initialize(name, content)
  #   @name = name
  #   @content = content
  #   @@all << self
  # end
  #
  # def self.create(params)
  #   self.new(params[:name], params[:content])
  #   self.save
  #   #self
  # end
  #
  # def self.save
  #   sql = <<-SQL
  #         INSERT INTO posts (name, content)
  #         VALUES (?, ?)
  #         SQL
  #
  #   DB[:conn].execute(sql, self.name, self.content)
  #   @id = DB[:conn].execute("SELECT last_insert_rowid() FROM posts")[0][0]
  # end
  #
  # def self.all
  #   @@all
  # end
  #
  # def self.last
  #   @@all.last
  # end
  #
  # def self.find(id)
  # end

end
