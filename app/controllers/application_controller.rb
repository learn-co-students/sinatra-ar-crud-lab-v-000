require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do #creates new post
    @post = Post.create(params)
    redirect '/posts'
  end

  get '/posts' do #displays index of all posts
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do #displays specific post
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do #displays form to update specific posts
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do #saves updated post
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end

  delete 'posts/:id/delete' do #removes post from database
    @post = Post.find(params[:id])
    @post.destroy
    redirect '/posts'
  end
end
