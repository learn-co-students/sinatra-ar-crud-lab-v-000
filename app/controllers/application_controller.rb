require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts' do 
    @posts = Post.all 
    erb :index
  end 

  get '/posts/new' do 
    erb :new
  end 

  post '/posts/new' do 
    Post.create(params)
    redirect '/posts'
  end 

  get '/posts/:id/edit' do 
    @post = Post.find_by_id(params[:id])
    erb :edit
  end 

  get '/posts/:id' do
    @post = Post.find_by_id(params[:id]) 
    erb :show
  end 

  post '/posts/:id/edit' do 
    @post = Post.find_by_id(params[:id])
    @post.update(name: params[:name], content: params[:content])
    redirect "/posts/#{@post.id}"
  end 

  get '/posts/:id/delete' do 
    @post = Post.find_by_id(params[:id])
    erb :delete
  end 

  post '/posts/:id/delete' do 

    Post.find_by_id(params[:id]).delete
    redirect '/posts'
  end 

end