require_relative '../../config/environment'
# order in which we define routes matters

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
    @post = Post.create(params)
    erb :posts
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
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end


  delete '/posts/:id/delete' do
    post = Post.find(params[:id])
    @name = post.name
    post.delete
    erb :delete
  end


end

#  Update: Model.update
# 1. get 'models/:id/edit' controller action will render the edit.erb view page.
# 2. edit.erb view page will contain the form for editing a given instance of a model.
# 3. edit.erb will send a PATCH request to patch '/models/:id'
# 4. patch '/models/:id' controller action will find the instance of the model to update, using the id from params, update and save that instance.
#
# We'll need to update config.ru to use the Sinatra Middleware that lets our app send patch requests.
# config.ru:
# ```
# use Rack::MethodOverride
# run ApplicationController
# ```
#
# add a line to your form:
# edit.erb:
# ```
# <form action="/models/<%= @model.id %>" method="post">
#     <input id="hidden" type="hidden" name="_method" value="patch">
#     <input type="text" ...>
# </form>
# ```
# The MethodOverride middleware will intercept every request sent and received by our application. If it finds a request with `name="_method"`, it will set the request type based on what is set in the value attribute. In this case patch.
