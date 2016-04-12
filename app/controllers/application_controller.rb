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
    @post = Post.create(params)
    erb :index
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
    @post.update(:id => params[:id], :content => params[:content], :name => params[:name])
    @post.save 
    erb :show
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    post_name = @post.name

    @post.destroy
    "#{post_name} was deleted"
  end

end