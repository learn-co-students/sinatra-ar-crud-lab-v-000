require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end
  
  get '/posts/new' do
    erb :new
  end
  
  post '/posts' do
    @post = Post.create(params)
    redirect '/posts'
  end
  
  get '/posts' do
    @posts = Post.all
    erb :index
  end
  
  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end
  
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end
  
  patch '/posts/:id' do
    old_post = Post.find(params[:id])
    new_params = {}
    new_params[:name] = params[:name]
    new_params[:content] = params[:content]
    old_post.update(new_params)

    redirect "/posts/#{params[:id]}"
  end
  
  delete '/posts/:id/delete' do
    Post.delete(params[:id])
    erb :delete
  end
  
end
