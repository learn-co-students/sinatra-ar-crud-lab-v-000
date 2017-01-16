require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do #renders new view page w/ form
    erb :new
  end

  post '/posts' do  #extracts the form data from the params and uses it to create a new instance of the post class
    @posts = Post.create(name: params[:name], content: params[:content])
    erb :'posts/index'
  end

  get '/posts' do #handles requests for all instances of a class
    @posts = Post.all
    erb :'posts/index'
  end

  get '/posts/:id' do #handles request for a given instance
    # binding.pry
    @post = Post.find_by_id(params[:id])
    erb :'posts/show'   #renders the @post object
  end

  get '/posts/:id/edit' do #edits a single post, retrieves edit page
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

  patch '/posts/:id' do #finds the instance of the model to update, using the id from params, update and save that instance.
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
