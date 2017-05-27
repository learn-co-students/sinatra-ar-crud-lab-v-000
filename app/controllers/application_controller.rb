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

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @id = params[:id]
    @post = Post.find_by_id(params[:id])
    erb :show
  end

  post '/posts' do
    @post = Post.create(params[:posts][-1])
    erb :show
  end

  get '/posts/:id/edit' do
    @id = :id
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    # This could be done simpler by simplifying the params in edit.erb.
    # But, this was good practice for nested hashes
    update_hash = params[:posts][params[:id]]
    @post = Post.find_by_id(params[:id])
    @post.update(update_hash) #:name => hash[:name], :content => hash[:content])
    erb :show
  end

  delete '/posts/:id/delete' do
    @post_to_delete = Post.find_by_id(params[:id])
    @post_to_delete.destroy
    erb :deleted
  end
end
