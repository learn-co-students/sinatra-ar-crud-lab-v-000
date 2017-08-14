require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
    "Hello World"
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    Post.create(name: params[:name], content: params[:content])
    redirect to '/posts'
  end

  get '/posts' do
    erb :index
  end

  get '/posts/:id' do
    #binding.pry
    erb :show
  end

  patch '/posts/:id' do
    p = Post.find(params[:id])
    p.update(name: params[:name], content: params[:content])
    redirect_path = "posts/#{params[:id]}"
    #binding.pry
    redirect to redirect_path
  end

  get '/posts/:id/edit' do
    erb :edit
  end

  delete '/posts/:id/delete' do
    params[:name] = Post.find(params[:id]).name
    Post.delete(params[:id])
    erb :delete
  end

end