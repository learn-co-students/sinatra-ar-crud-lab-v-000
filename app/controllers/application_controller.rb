
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base
  #CRUD

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect '/posts'
  end

  #Create
  get '/posts/new' do

    erb :new #renders the .erb file that contains our form
  end

  post '/posts' do
    Post.create(name: params[:name], content: params[:content]) #extracts form data from the params and uses it to create a new instance of your model class
    
    redirect '/posts'
  end

  #Read - all instances of a class or specific instance of a class
  get '/posts' do#handles request for all instances of a class
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do#handles request for specific instance of a class
    
    @post = Post.find_by(id: params[:id])

    erb :show#use show.erb for specific instances
  end


  #Update
  get '/posts/:id/edit' do#used to edit the form, add additional code to config.ru
    @post = Post.find(params[:id])
    
    erb :edit#create the edit form that patch to /posts/
  end

  patch '/posts/:id' do
    @post = Post.find_by(id: params[:id])
    @post.update(name: params[:name], content: params[:content])
    erb :show
  end

  delete '/posts/:id/delete' do
    @post = Post.find_by(id: params[:id])
    @post.destroy

    erb :delete
  end

end
