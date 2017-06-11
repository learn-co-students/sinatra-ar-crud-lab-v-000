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

  get '/posts/:id' do 
  	@post = Post.find(params[:id])
  	erb :show
  end

  get '/posts/:id/edit' do 
  	@post = Post.find(params[:id])
  	erb :edit
  end

  post '/posts' do 
  	Post.create(params)
  	redirect to :'/posts'
  end

  patch '/posts/:id' do
  	Post.find(params[:id]).update(name: params[:name], content: params[:content])
  	redirect to :"/posts/#{params[:id]}"
  end

  delete '/posts/:id' do 
  	@post = "#{Post.find(params[:id]).name}"
    Post.delete(params[:id])
  	erb :deleted
  end

end