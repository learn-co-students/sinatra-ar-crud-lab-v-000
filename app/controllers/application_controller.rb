require_relative '../../config/environment'
require 'pry'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do

  end
  get '/posts/:id' do
    #grab the post id, and set it equal to the post
  end
  get '/posts/new' do
    erb :view
  end

  post '/posts' do

  end

  get '/posts'  do
   #grab all the posts and store them in an instance variable @posts
  end

  get '/posts/:id/edit' do
    #renders edit.rb should update a specific blog post,and post to using patch '/posts/:id'
  end
end
