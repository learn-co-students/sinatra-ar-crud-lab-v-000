require_relative '../../config/environment'
require 'pry'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do #homepage
    erb :index
  end

  get '/posts/new' do #loads new form
    erb :new
  end

  post '/posts' do #creates a post
    @post = Post.create(params)
    redirects to '/posts'
  end

  get '/posts' do #loads index page
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do#show action
  @post = Post.find(params[:id])
  #binding.pry
    erb :show
  end

  get '/posts/:id/edit' do#Update: Loads form for edit
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

  post '/posts/:id' do  #updates a post
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end
  #
  post '/posts/:id/delete' do #delete action
  @post = Post.find_by_id(params[:id])
  #binding.pry
  @post.delete
  #binding.pry
  erb :deleted
end

end
