require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do #renders view page w/ form
    erb :new
  end

  post '/posts' do  #extracts the form data from the params and uses it to create a new instance of the posts class
    @post1 = Post.create(name: params[:name], content: params[:content])
    erb :index
  end

  get '/posts' do #handles requests for all instances of a class
    @posts = Post.all
    erb :'posts/index'
  end

  get '/posts/:id' do #handles request for a given instance
    @post = Post.find_by_id(params[:id])
    erb :'assignments/show'
  end
end
