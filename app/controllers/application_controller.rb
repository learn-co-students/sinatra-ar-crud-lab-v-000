require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

 @@deleted=""

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @post=Post.create(name:params[:post_name], content: params[:post_content])
    redirect to '/posts'
  end

  get '/posts' do
    @posts=Post.all
    erb :index
  end

  get '/posts/:id' do  #loads show page
    @post = Post.find_by_id(params[:id])

    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

  patch '/posts/:id' do  #updates a post
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end

  delete '/posts/:id/delete' do #delete action
    @post = Post.find_by_id(params[:id])
    @deleted=@post.name
    @post.delete

    erb :delete

    #redirect to '/posts'
  end


end
