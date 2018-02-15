require_relative '../../config/environment'
require 'pry'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  get '/posts/new' do #loads new form
    erb :new
  end

  post '/posts' do #creates a post
    @post = Post.create(params)

    redirect to '/posts'
  end

  get '/posts' do # loads index page/shows all posts
    @posts = Post.all
    erb :index
  end

    get '/posts/:id' do
    @post = Post.find(params[:id])
    
    erb :show

  end

end
