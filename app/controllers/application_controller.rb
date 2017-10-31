require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do

    erb :new
  end

  post "/posts" do
    @post = Post.new(name: params[:name], content: params[:content])
    @post.save
    @posts = Post.all

    erb :index
  end

  get "/posts" do
    @posts = Post.all

    erb :index
  end

  get "/posts/:id" do
    @post = Post.all.select do |post|
          post.id == params[:id].to_i
        end.first

    erb :show
  end

  get "/posts/:id/edit" do
    @post = Post.all.select do |post|
          post.id == params[:id].to_i
        end.first

    erb :edit
  end

  patch "/posts/:id" do
    @post = Post.all.select do |post|
          post.id == params[:id].to_i
        end.first
    @post.update(name: params[:name], content: params[:content])

    erb :show
  end

  delete "/posts/:id/delete" do
    @post = Post.all.select do |post|
          post.id == params[:id].to_i
        end.first
    @post.destroy


    erb :delete
  end
end
