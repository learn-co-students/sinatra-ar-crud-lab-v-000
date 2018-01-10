require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
    erb :index  
  end

  get '/post/new' do
    erb :new
  end

  post '/posts' do
    Post.create(name: params[:post_name), content: params[:content_name])
  end

end


