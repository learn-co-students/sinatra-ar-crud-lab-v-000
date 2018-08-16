
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/posts/new' do #load new blog post form
    erb :new
  end
  
  post '/posts' do #create a blog post
    @posts = Post.create(params)
    redirect to '/posts'
  end
  
  get '/posts' do #load index page
    @posts = Post.all
    erb :index
  end
  
  get '/posts/:id' do #load show page
    @post = Post.find_by_id(params[:id])
    erb :show
  end
  
  get '/posts/:id/edit' do #update post
    @post = Post.find_by_id(params[:id])
    erb :edit
  end
  
  patch '/posts/:id' do #saves update to post
    @post = Post.find_by_id(params[:id])  
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end
  
  delete '/posts/:id/delete' do #deletes blog post
    @post = Post.find_by_id(params[:id])  
    @post.delete
    redirect to '/posts'
  end
    
  
  
end
