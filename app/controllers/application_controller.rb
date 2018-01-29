require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

# shows index page
  get '/' do
    erb :index
  end

# shows new page which has a form to create a post
  get '/posts/new' do
    erb :new
  end

#creates a post
  post '/posts' do
    @post = Post.create(params)
    redirect to '/posts'
  end

#shows all posts on the index page
  get '/posts' do
    @posts = Post.all
    erb :index
  end

#finds a post
  get '/posts/:id' do
    @post = Post.find(params[:id])
    #binding.pry
    erb :show
  end

#edits a post
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    #binding.pry
    erb :edit
  end

#updates the edited post
  patch '/posts/:id' do
    @post = Post.find(params[:id])
    edited_post = {:name => params[:name], :content => params[:content]}
    @post.update(edited_post)
    @post.save
    redirect to "/posts/#{params[:id]}"
  end

#deletes the post
  post '/posts/:id/delete' do #delete action
    @post = Post.find_by_id(params[:id])
    binding.pry
    @post.delete
    erb :deleted
  end
end
