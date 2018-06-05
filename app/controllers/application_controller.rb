
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    #binding.pry
    erb :new
  end

  post '/posts' do
    #binding.pry
    @post1 = Post.create(name: params[:name], content: params[:content])
    erb :index
  end


end
