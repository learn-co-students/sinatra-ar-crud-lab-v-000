require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # get '/' do
  #
  # end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @post = Post.create(params)
    # @name = params[name]
    # @content = params[content]
    redirect to '/posts'
    # erb :index
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end


  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    # @post_edit = Post.find(params[:id])
    # @post_edit.name = params[:name]
    # @post_edit.content = params[:content]
    # @post_edit.save
    # erb :show
    @post = Post.find(params[:id])
    @post.update(name: params[:name], content: params[:content])
    # redirect to ("/posts/#{@post.id}")
    erb :show
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @name = @post.name
    @post.destroy
    erb :deleted
    # @post_delete = Post.find(params[:id])
    # @post_delete.destroy
    # erb :deleted
  end
end
