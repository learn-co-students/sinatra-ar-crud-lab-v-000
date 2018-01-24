require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do #loads new form
    erb :new
  end

  post '/posts' do #creates post
    @post = Post.create(name: params[:name], content: params[:content])
    redirect to '/posts' #redirect url as well with correct url where erb doesnt' change url at the top!
  end

  get '/posts' do #loads index page
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do #loads a post
    @post = Post.find_by_id(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do #edit a post
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id]) # if you have find, it will automatically look by id
    @post.update(name: params[:name], content: params[:content]) # this does everything that all those lines does plus saves it.
    erb :show
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.delete
    erb :deleted
  end
end
