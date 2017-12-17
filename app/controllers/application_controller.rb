require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    "Navigate over to '/posts/ to start'"
  end

  get '/posts' do
    # This action should use Active Record to grab all of the posts and store them in an instance variable, @posts. Then, it should render the index.erb view.
    @posts = Post.all

    erb :index
  end

  get '/posts/new' do
    # new.erb, with a form that POSTs to a controller action, /posts. The controller action should use the Create CRUD action to create the blog post and save it to the database. Then, the action uses erb to render the index view page.
    erb :new

  end

  post '/posts' do
    p = Post.create(name: params[:name], content: params[:content])
    # binding.pry
    @posts = Post.all
    # binding.pry
    redirect to '/posts'
  end

  get '/posts/:id' do
    #This action should use Active Record to grab the post with the id that is in the params and set it equal to @post. Then, it should render the show.erb view page.
    @p = Post.find_by_id(params[:id])
    # binding.pry
    erb :show
  end

  get '/posts/new' do
    erb :new
  end



  get '/posts/:id/edit' do
    # that renders the view, edit.erb. This view should contain a form to update a specific blog post and POSTs to a controller action, patch '/posts/:id'.
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save

    @name = @post.name
    @content = @post.content
    @id = @post.id

    erb :show
  end

  delete '/posts/:id/delete' do
    @post = Post.find_by_id(params[:id])
    @post.delete

    erb :delete
  end


  # . To initiate this action, we'll just add a "delete button" to the show page. This "button" will actually be a form, disguised as a button (intriguing, I know). The form will send a POST request to the delete controller action, where we will identify the post to delete and delete it. Then, the action should render a delete.erb view which confirms that the post has been deleted.
  # MAKING OUR DELETE "BUTTON"
  # In order to make a form that looks like a button, all we need to do is make a form that has no input fields, only a "submit" button with a value of "delete". So, give your form tag a method of "post" and an action of "/posts/:id/delete'. Make sure to dynamically set the :id of the form action! You'll also need to make sure the form includes the hidden input tag to change the request from post to delete.


end
