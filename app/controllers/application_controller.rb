require_relative '../../config/environment'
require_relative '../../app/models/model.rb'
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
    Post.create(params)
    redirect '/posts'
  end

  get '/posts' do
    @posts=Post.all
    erb :index
  end

  get '/posts/:id' do
    @post=Post.find(params[:id])
    erb :post
  end

  get '/posts/:id/edit' do
    @post=Post.find(params[:id])
    erb :update
  end

  post '/posts/:id' do
    Post.update(params[:id],{name: params[:name],
                             content: params[:content]})
    redirect "/posts/#{params[:id]}"
  end

  post '/posts/:id/delete' do
    @name=Post.find(params[:id]).name
    Post.delete(params[:id])
    erb :deleted
  end
  
end
