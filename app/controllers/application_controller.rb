require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

#  get '/' do
#  end

  get '/posts/new' do #loads a new form
    erb :new
  end

  post '/posts' do #creates a post
    @post = Post.create(params)
    redirect to '/posts'
  end

  get '/posts' do #loads index page with all posts
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do #loads the show page with specific post
    @post = Post.find_by_id(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do #loads the edit form
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

  patch '/posts/:id' do #updates a post
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end

  delete '/posts/:id/delete' do #delete action, deletes a post
    @post = Post.find_by_id(params[:id])
    @post.delete
    erb :delete
  end
end
