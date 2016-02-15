require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

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
  	Post.create(name: params[:name], content: params[:content])
  	@posts = Post.all
  	erb :index
  end
  
  get '/posts' do
  	@posts = Post.all
  	erb :index
  end
  
  delete '/posts/:id/delete' do
  	Post.delete(params[:id])
  	redirect('/posts')
  end
  
  get '/posts/:id/edit' do
  	@post2 = Post.find(params[:id])
  	erb :edit
  end
  
  get '/posts/:id/delete' do
  	@post = Post.find(params[:id])
  	erb :show
  end
  
  get '/posts/:id' do
  	@post = Post.find(params[:id])
  	erb :show
  end
  
  patch '/posts/:id' do
  	Post.find(params[:id]).update(name: params[:name], content: params[:content])
  	@post = Post.find(params[:id])
  	erb :show
  end
end