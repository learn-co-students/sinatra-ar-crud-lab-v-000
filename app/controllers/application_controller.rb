require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
    Welcome!
  end

  get '/posts/new' do
  	erb :new
  end

  post '/posts' do
  	#binding.pry
  	@post = Post.create(params)

  	redirect to :'/posts'
  end

  get '/posts' do
  	@posts = Post.all
  	erb :index
  end

  get '/posts/:id' do
  	@post = Post.find_by_id(params[:id])
  	erb :show
  end

  get '/posts/:id/edit' do
  	@post = Post.find_by_id(params[:id])

  	erb :edit
  end

  patch '/posts/:id' do
  	@post = Post.find_by_id(params[:id])
  	#binding.pry
  	@post.name = params[:name]
  	@post.content = params[:content]
  	@post.save

  	erb :show
  end

  delete '/posts/:id/delete' do
  	#binding.pry
  	@post = Post.find_by_id(params[:id])
  	@deleted = @post.name
  	@post.destroy

  	@posts = Post.all

  	erb :index
  end

end