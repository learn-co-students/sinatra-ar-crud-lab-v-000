require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :root
  end

#This is the C -(create) in the CRUD
#This is where the view that provides the form for the user's input
  get '/posts/new' do
# get '/' do *** Show something ***
    erb :new
  end
#This is where the user's input is used to instantiate a new object
  post '/posts' do
# post '/' do *** Create something ***
    @post = Post.create(name: params[:name], content: params[:content])
    redirect to '/posts'
  end

#This begins the R -(read) in the CRUD
  get '/posts' do
    @posts = Post.all
    erb :index
  end

  #now I need to find a post and show it
  get '/posts/:id' do
    @post = Post.find(params[:id]) # This works!  Not getting to show.erb
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

end

# put '/' do *** Replace something ***
# patch '/' do *** Modify something ***
# delete '/' do *** Annihilate something ***
# link: http://www.sinatrarb.com/intro.html
