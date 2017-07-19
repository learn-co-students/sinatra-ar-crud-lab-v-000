require_relative '../../config/environment'
require_relative '../models/post'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

#Create the get '/posts' controller action.
  get '/posts' do
#use Active Record to grab all of the posts and store them in an instance variable, @posts.
    @posts = Post.all
#render the index.erb view.
    erb :index
  end

#create a route in your controller, get '/posts/new', that renders the new.erb view.
  get '/posts/new' do
    erb :new
  end

#Create the get '/posts/:id' controller action.
  get '/posts/:id' do
#This action should use Active Record to grab the post with the id that is in the params and set it equal to @post.
    @post = Post.find(params[:id])
#render the show.erb view page.
    erb :show
  end

#Create a controller action, get '/posts/:id/edit'
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
#renders the view, edit.erb
    erb :edit
  end

  post '/posts' do
    Post.create(params)
    @posts = Post.all
    erb :index
  end

#controller action, patch '/posts/:id'
  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end

#delete controller action, delete '/posts/:id/delete'
  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.destroy
    erb :delete
  end
end
