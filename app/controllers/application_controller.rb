require_relative '../../config/environment'

require 'sinatra/base'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/post/new' do 
    erb :new 
  end

  post '/models' do
    Post.create(name: params[:name], content: params[:content])
    @posts = Post.all
    erb :index
  end 

end