require_relative '../../config/environment'

require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do
    erb :"../views/new"
  end

  post '/posts' do
    @post = Post.create()
    
    erb :"../views/index"
  end

  get '/posts' do
    @posts = Post.all

    erb :"../views/show"
  end
end
