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
    Post.create(name: params[:post][:name], content: params[:post][:content])
    redirect '/posts'
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
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update(params[:post])

    redirect "/posts/#{params[:id]}"
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @name = @post.name
    @post.destroy

    @delete_message = "#{@name} was deleted"
    @posts = Post.all
    erb :index
  end
end