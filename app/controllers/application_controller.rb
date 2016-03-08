require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do 
    Post.create(params)
    redirect to '/posts'
  end

  get '/posts' do 
    @posts = Post.all
    erb :index 
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do 
    @current_post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do 
    @post_to_update = Post.find(params[:id])
    @post_to_update.name = params[:name]
    @post_to_update.content = params[:content]
    @post_to_update.save
    redirect to "/posts/#{@post_to_update.id}"
  end

  delete '/posts/:id/delete' do 
    @deleted_post = Post.find(params[:id])
    # @post_id = @deleted_post.id
    @deleted_post.destroy
    erb :delete
  end



end