require_relative '../../config/environment'
require 'pry'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


	get '/' do
		erb :index
	end


	get '/posts' do 
		@posts = Post.all
		erb :index
	end


	post '/posts' do
		post = Post.create(params)
		post.save
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
		@post2 = Post.find(params[:id])
		erb :edit
	end


	patch '/posts/:id' do
		post = Post.find(params[:id])
		post.name = params[:name]
		post.content = params[:content]
		post.save 	
	end

	
	get '/show' do 
		erb :show
	end
end
