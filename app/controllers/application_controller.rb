
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
    @posts = [] # all @posts variables sent to index.erb should be array to be iterated through
    @posts << Post.create(name: params[:name], content: params[:content])

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

  patch '/posts/:id' do
    Post.update(params[:id], :name => params[:name], :content => params[:content])
    @post = Post.find(params[:id])

    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])

    erb :edit
  end

  delete '/posts/:id/delete' do
    Post.delete(params[:id])
    erb :delete
  end

end
