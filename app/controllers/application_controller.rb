require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  get "/posts" do
    @posts = Post.all
    erb :'/posts/index'
  end

  get "/posts/new" do
    erb :'/posts/new'
  end

  post "/posts" do
    @post = Post.create(name: params[:name], content: params[:content])
    redirect to "/posts"
  end

  get "/posts/:id/edit" do
    @post = Post.find(params[:id])
    erb :'/posts/edit'
  end

  get "/posts/:id" do
    @post = Post.find(params[:id])
    erb :'/posts/show'
  end

  patch "/posts/:id" do
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :'/posts/show'
  end

  delete "/posts/:id/delete" do
    @post = Post.find(params[:id])
    @post.destroy
    "#{@post.name} was deleted"
  end
end
