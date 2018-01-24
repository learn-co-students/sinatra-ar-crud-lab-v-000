require_relative '../../config/environment'

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

	post "/posts" do
		Post.create(name: params[:name], content: params[:content])
		@posts = Post.all
		
		erb :index
	end

	get '/posts' do
		@posts = Post.all		

		erb :index
	end

	get '/posts/:id' do
		@post = Post.find_by_id(params[:id])
		erb :show
	end

	get '/posts/:id/edit' do #loads edit form
		@post = Post.find_by_id(params[:id])
		erb :edit
	end

	post '/posts/:id' do
		@post = Post.find_by_id(params[:id])
		@post.name = params[:name]
		@post.content = params[:content]
		@post.save
		erb :show
	end

	post '/posts/:id/delete' do
		@post = Post.find_by_id(params[:id])
		@post.delete
		redirect to '/posts'
	end

end
