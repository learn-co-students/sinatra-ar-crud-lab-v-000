class CreatePost < ActiveRecord::Migration
  def change
    create_table :posts do |t| #from dog example in activerecord setup in sinatra
      t.string :name
      t.string :content
    end
  end
end
#first, bundle exec rake db:create_migration NAME=create_post
#had to use bundle exec db:migrate SINATRA_ENV=test
