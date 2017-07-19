#Post model. Make sure the class inherits from ActiveRecord::Base
class Post < ActiveRecord::Base
  def self.create_table
    sql = <<-SQL
    CREATE TABLE IF NOT EXISTS posts (
      id INTEGER PRIMARY KEY,
      title TEXT,
      content TEXT
    )
    SQL

    ActiveRecord::Base.connection.execute(sql)
  end
end
