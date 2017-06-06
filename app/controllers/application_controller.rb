require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

# CREATE --------------------------------------
  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    post = Post.create(name: params[:name], content: params[:content])
    redirect '/posts'
  end

# READ ---------------------------------------
  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

# UPDATE -------------------------------------
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update(name: params[:name], content: params[:content])
    erb :show
  end

# DELETE -------------------------------------
  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.destroy
    erb :delete
  end

end
