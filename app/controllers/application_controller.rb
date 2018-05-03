
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  configure :development do
      set :database,
      "sqlite3:db/posts.db"
    end
    
  get '/posts/new' do
    erb :new
  end

  post '/posts' do
  attributes= {name: params[:name], content: params[:content]}
  Post.create(attributes)
  erb :index
end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit'do
  @post = Post.find(params[:id])
  erb :edit
  end

  patch '/posts/:id' do
     Post.update(params[:id], name: params[:name], content: params[:content])
     erb :show
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.delete
    erb :show
  end

end
