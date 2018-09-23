
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do #loads new form
    erb :new
  end


  post '/posts' do
    post = Post.create(params)
    redirect to '/posts'  #create a post
  end

  get '/posts' do
    @posts = Post.all
    erb :index       #loads index page
  end

  get '/posts/:id' do  #loads show page
    @post = Post.find_by_id(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do #load edit forms
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

  patch '/posts/:id' do #update a post
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end

  delete '/posts/:id/delete' do #delete action
    @post = Post.find_by_id(params[:id])
    @post.delete
    erb :delete
  end

end
