
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
    @posts = []
    @posts << Post.create(params)
    erb :index
  end
  #another way to do this is:
  #post '/posts' do
  #  @post = Post.create(params)
  #  redirect to '/posts'
  #end

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
    @post.update(name: params[:name], content: params[:content])
    redirect to ("/posts/#{params[:id]}")
  end
  #could also do:
  #patch '/posts/:id' do
  #  @post = Post.find_by_id(params[:id])
  #  @post.name = params[:name]
  #  @post.content = params[:content]
  #  @post.save
  #  erb :show
  #end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.destroy
    #or @post.delete
    erb :delete
  end

end
