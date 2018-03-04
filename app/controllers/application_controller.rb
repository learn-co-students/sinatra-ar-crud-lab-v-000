require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/posts/new' do
    #renders the new.erb view which shows user a form that POSTs to a controller action /posts
    erb :new
  end

  post '/posts' do
    #handles a get request to show all the instances of the Post class, ie www.example/posts
    #create a blog post and save it to the database using create CRUD
    @post = Post.create(params)
    redirect to '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    # edit.erb view page will contain the form for editing a given instance of a model.
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save

    erb:show
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.delete

    erb :delete
  end

end
