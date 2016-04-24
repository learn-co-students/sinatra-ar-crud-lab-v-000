require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do #create a route in your controller, get '/posts/new', that renders the new.erb view
    erb :new
  end

  post '/posts' do #use the Create CRUD action to create the blog post and save it to the database
    @posts = Post.create(params)
    redirect to '/posts'
  end

  get '/posts' do #should use Active Record to grab all of the posts and store them in an instance variable, @posts
    @posts = Post.all
    erb :index #it should render the index.erb view
  end

  get '/posts/:id' do #action should use Active Record to grab the post with the id that is in the params and set it equal to @post
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do #create a controller action, get '/posts/:id/edit, that renders the view, edit.erb
    @post = Post.find(params[:id])
    erb :edit # contain a form to update a specific blog post
  end

  patch '/posts/:id' do #from edit.erb POSTs to a controller action, patch '/posts/:id
    @post = Post.find(params[:id])
    @post.update(name: params[:name], content: params[:content])
    erb :show
  end

  delete '/posts/:id/delete' do #delete CRUD action corresponds to the delete controller action, delete '/posts/:id/delete'
    @post = Post.find(params[:id]).destroy
    erb :deleted
  end

end