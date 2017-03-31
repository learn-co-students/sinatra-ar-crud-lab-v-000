require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
    set :database, "sqlite3:db/#{ENV['SINATRA_ENV']}.sqlite"
  end

  get "/" do
    redirect '/posts'
  end

  get '/posts' do #Read - indexing all posts
    @posts = Post.all
    erb :index
  end

  post '/posts' do #Create - make new post then show index page
    Post.create(name:params[:name],content:params[:content])
    redirect '/posts'
  end

  get '/posts/new' do #Create - displays form for making new post
    erb :new
  end

  get '/posts/:id' do #Read - displays one post by id
    @post = Post.find_by(id: params[:id])
    erb :show
  end

  get '/posts/:id/edit' do #Update - displays form to update particular post
    @post = Post.find_by(id: params[:id])
    erb :edit
  end

  patch '/posts/:id' do #Update - finds and updates particular post, then redirects to view that post
    @post = Post.find_by(id: params[:id])
    @post.update_attributes(name: params[:name], content: params[:content])
    erb :show
  end

  delete '/posts/:id/delete' do #Delete - finds and deletes particular post, shows delete confirmation page
    @post = Post.find_by(id: params[:id]).delete
    erb :delete
  end

end
