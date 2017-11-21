require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do

    erb :new
  end

  post '/posts' do
    #add
    Post.new(params)
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    #get post by id
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    # @post = get post by params[:id]
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    #get the post by id then update
    erb :index
  end

  delete '/posts/:id/delete' do
    #get the post by id then delete
    erb: delete.erb
  end

end
