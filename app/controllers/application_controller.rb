require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
     redirect to '/posts' #index page with all blog posts
  end

  get '/posts/new' do #new form for blog post
    erb :new
  end

  post '/posts' do #Create Action: creates a new blog post
    @post = Post.create(params)
    redirect to '/posts'
  end

  get '/posts' do #Read Action: Index action: displays all the blog posts
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do #Read Action: show action: displays post by .id
    @post = Post.find_by_id(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do #Update Action: displays the existing object in the edit form
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

  post '/posts/:id' do  #Update Action: saves edits to a blog post
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end

  post '/posts/:id/delete' do #Delete Action: deletes a blog post from the database
    @post = Post.find_by_id(params[:id])
    @post.delete
    erb :deleted
  end

end
