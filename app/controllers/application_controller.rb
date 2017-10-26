require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

    erb :homepage
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find_by(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find_by(params[:id])
    erb :edit
  end

  post "/posts" do
    Post.create(params)

    redirect to '/posts'
  end

  delete '/posts/:id/delete' do

    erb :delete
  end

end
