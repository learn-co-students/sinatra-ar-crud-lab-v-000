require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    erb :posts
  end
  #The controller action should use the Create CRUD action to create the blog post and save it to the database. Then, the action uses erb to render the index view page.


end
