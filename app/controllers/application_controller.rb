require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
    "Hello, World!"
  end
  
  get '/posts/new' do
    erb :new
  end
  
  get '/posts' do
    @posts = Post.all
    erb :index
  end
  
  post '/posts' do
    # puts "CREATING POST...."
    # puts params
    post = Post.create(params)
    redirect_to '/posts'
  end
  
  get '/posts/:id' do
    @post = Post.find_by(id: params[:id])
    erb :show
  end
  
  get '/posts/:id/edit' do
    @post = Post.find_by(id: params[:id])
    erb :edit
  end
  
  patch '/posts/:id' do
    post = Post.find_by(id: params[:id])
    post.name = params[:name]
    post.content = params[:content]
    post.save
    redirect to "/posts/#{post.id}"
  end
  
  delete '/posts/:id/delete' do
    @post = Post.find_by(id: params[:id])
    @post.delete
    erb :deleted
  end
  
end