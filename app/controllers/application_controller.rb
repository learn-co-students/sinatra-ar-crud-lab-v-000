
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

	get '/posts/new' do
		erb :'posts/new'
	end
	
	post '/posts' do
		post_ = Post.create
		post_.name = params[:post][:name]
		post_.content = params[:post][:content]

		post_.save

		@post = post_

		erb :'posts/index'
	end

	get '/posts' do
		@posts = Post.all
		erb :'/index'
	end

	get '/posts/:id' do
		@post = Post.find(params[:id])
		erb :'posts/show'
	end

	get '/posts/:id/edit' do
		@post = Post.find(params[:id])
		erb :'posts/edit'
	end

	patch '/posts/:id' do
		@post = Post.find(params[:id])
		
		name_ = params[:post][:name]
		content_ = params[:post][:content]
	
		@post.name = name_
		@post.content = content_
		@post.save
		
		erb :'/'
	end

	delete '/posts/:id/delete' do
		post_ = Post.find(params[:id])
		post_.delete
		erb :'posts/delete'
	end
end
