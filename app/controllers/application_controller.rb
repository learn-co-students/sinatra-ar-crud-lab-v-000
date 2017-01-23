require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  # renders new view page w/ form
  get '/posts/new' do
    erb :new
  end

  # extracts the form data from the params and uses it to create a new instance of the post class
  post '/posts' do
    @posts = Post.create(name: params[:name], content: params[:content])
    erb :'posts/index'
  end

  # handles requests for all instances of a class
  get '/posts' do
    @posts = Post.all
    erb :'/posts/index'
  end

  # handles request for a given instance
  get '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    erb :'posts/show'   #renders the @post object
  end

  # edits a single post, retrieves edit page
  get '/posts/:id/edit' do
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

  # finds the instance of the model to update, using the id from params, update and save that instance.
  patch '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    # <#Post: name: "DOgd", content: "I love fgos">
    @post.update(name: params[:name], content: params[:content])
    # <#Post : name: "Cats", contetenL "I hate cats">
    @post.save
    # persits that instance to the databse
    erb :'/posts/show'
  end

  delete '/posts/:id/delete' do
    @post = Post.find_by_id(params[:id])
    @post.destroy
    erb :deleted
  end
end
