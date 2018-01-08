require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  get '/posts/new' do
    erb :new
    @posts = Post.all
    Post.create(params[:name], params[:content])
  end

  post '/posts' do
    @posts = Post.all
    erb :posts
  end

  get '/posts/:id' do
    erb :posts
  end
end
