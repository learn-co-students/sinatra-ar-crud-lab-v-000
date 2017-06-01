require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

# START OF CREATE ACTION
  get '/' do
		@posts = Post.all
		erb :index
  end

	get '/posts/new' do
		erb :new
	end

  post '/posts' do
    @post = Post.create(name: params[:name], content: params[:content])
    @posts = Post.all
    erb :index
  end
# END OF CREATE ACTION

# START OF READ ACTIOM
	# **INDEX ACTION**
	get '/posts' do
		@posts = Post.all
		erb :index
	end

	# **SHOW ACTION**
	get '/posts/:id' do
		@post = Post.find(params[:id])
		erb :show
	end
# END OF SHOW ACTION

# START OF UPDATE ACTION
	get '/posts/:id/edit' do
		@post = Post.find(params[:id])
		erb :edit
	end

	patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update(name: params[:name], content: params[:content])
    erb :show
  end

	delete '/posts/:id/delete' do
		@post = Post.find(params[:id])
		@post.destroy
		erb :delete
	end

end
