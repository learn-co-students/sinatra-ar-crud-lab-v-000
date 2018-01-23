require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

#First, create a route in your controller, get '/posts/new', that renders the new.erb view.
  get '/posts/new' do #loads new form
    erb :new
  end

  post '/posts' do #creates a post
    #The controller action should use the Create CRUD action to create the blog post and save it to the database.
    @post = Post.create(params) #mass assignment of post attributes

    redirect to '/posts' #cant see new post, so redirect to /posts
  end

  get '/posts' do #now you can see ze posts !
    @posts = Post.all #stores all posts in instance variable
    #Then, the action uses erb to render the index view page
    erb :index
  end

  #The show action should render the erb view show.erb, which shows an individual post.
  get '/posts/:id' do #you want to show a specific blog post
    @post = Post.find_by_id(params[:id]) #use AR to locate post w/ matching id. store in instance variable
    erb :show #render show.erb
  end

  #The index action should render the erb view index.erb, which shows a list of all of the posts
  get '/' do
    erb :index
  end

  get '/posts/:id/edit' do #loads edit form
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

  post '/posts' do #creates a post
    #The controller action should use the Create CRUD action to create the blog post and save it to the database.
    @post = Post.create(params) #mass assignment of post attributes

    redirect to '/posts' #cant see new post, so redirect to /posts
  end

  delete '/posts/:id/delete' do #delete action
    @post = Post.find_by_id(params[:id])
    @post.delete
    erb :deleted
  end

  patch '/posts/:id' do  #updates a post
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end
end
