require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do #loads a new form
    erb :new
  end

  post '/posts' do #creates a new post
    @post = Post.create(params)
    redirect to '/posts'
  end

  get '/posts' do #renders index page
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do #loads show page
    @post = Post.find_by_id(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

  post '/posts/:id' do
      @post = Post.find_by_id(params[:id])
      @post.name = params[:name]
      @post.content = params[:content]
      @post.save
      erb :show
    end

    post '/posts/:id/delete' do #delete action
      @post = Post.find_by_id(params[:id])
      @post.delete
      erb :deleted
    end


end
