require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do #creates new item
    erb :new
  end

  post '/posts' do #posted items sent here
    Post.create(name: params[:name], content: params[:content])
    @posts = Post.all
    erb :index
  end

  get '/posts' do #reads all posts
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do #reads an instance of a post/single post
    @post = Post.find_by_id(params[:id])
    erb :show #renders the @post object
  end

  get '/posts/:id/edit' do  #update method
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

  patch '/posts/:id' do #find the instance of the post to update, using the id from params, update, and save that instance
    @post = Post.update(params[:id], name: params[:name], content: params[:content])
    erb :show
  end

  delete '/posts/:id/delete' do #deletes post
    @post = Post.find(params[:id])
    Post.delete(params[:id])
    erb :delete
  end
end
