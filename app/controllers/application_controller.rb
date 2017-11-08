require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/posts/new' do

    erb :new
  end

  get '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    erb :show
  end

  post '/posts' do
    @post = Post.new(params)
    @post.save
    erb :index
  end

  get '/posts' do
    @posts = Post.all

    erb :index
  end

  get '/posts/:id/edit' do #displays form pre-filled with content to edit
    @post = Post.find_by_id(params[:id])

    erb :edit
  end

  patch '/posts/:id' do #updates the post in the db and displays
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save

    erb :show
  end

  post '/posts/:id/delete' do
    @post = Post.find_by_id(params[:id])
    @post.destroy

    erb :delete
  end

end
