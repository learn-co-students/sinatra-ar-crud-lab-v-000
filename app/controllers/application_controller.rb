require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do #loads new form
    erb :new
  end

  post '/posts' do #creates post
    @post = Post.create(name: params[:name], content: params[:content])
    redirect to '/posts'
  end

  get '/posts' do #loads index page
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do #loads a post
    @post = Post.find_by_id(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do #edit a post
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

  delete '/posts/:id/delete' do


  end
end
