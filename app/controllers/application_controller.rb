
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get "/posts/new" do
    erb :new
  end

  post "/posts" do
    #! Create method is part of ActiveRecord already, silly!
    Post.create(params)
    redirect '/posts'
  end

  get "/posts" do
    #? Does active record have its own all method or is the one we made?
    @posts=Post.all
    erb :index
  end

  get "/posts/:id" do
    #? Is it better to do this here or in the ERB?
    @post=Post.find(params[:id])
    erb :show
  end

  get "/posts/:id/edit" do
    @post=Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post=Post.find(params[:id])
    @post.name=params[:name]
    @post.content=params[:content]
    @post.save!
    erb :show
  end

  delete '/posts/:id/delete' do
    Post.destroy(params[:id])
    erb :delete
  end
end
