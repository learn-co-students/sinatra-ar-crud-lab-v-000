require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  post '/posts' do
  	#binding.pry
  	post = Post.create(name: params[:name], content: params[:content])
  	#binding.pry
  	erb :index
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

  patch '/posts/:id' do
  	@post = Post.find(params[:id])
  	@post.update(name: params[:name], content: params[:content])
  	redirect to("/posts/#{@post.id}")
  end

  get '/posts/:id/edit' do
  	@editpost = Post.find(params[:id])
  	erb :edit
  end

  get '/posts/:id/delete' do
  	@post = Post.find(params[:id])
  	erb :show
  end

  delete '/posts/:id/delete' do
  	@deletedpost = Post.find(params[:id])
  	Post.delete(params[:id])
  	erb :delete
  end
end