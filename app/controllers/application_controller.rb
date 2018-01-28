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

  post '/posts' do
    @post = Post.create(:name => params[:name], :content => params[:content])
    @name = @post.name
    @content = @post.content
    erb :view
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @id = params[:id]
    @post = Post.find(params[:id])
    @name = @post.name
    @content = @post.content
    erb :view
  end

  get '/posts/:id/edit' do
    @id = params[:id]
    @post = Post.find(params[:id])
    @name = @post.name
    @content = @post.content
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    @name = @post.name
    @content = @post.content
    erb :view
  end

  delete '/posts/:id/delete' do
    @id = params[:id]
    @post = Post.find(params[:id])
    @name = @post.name
    @post.destroy
    erb :delete
  end
end
