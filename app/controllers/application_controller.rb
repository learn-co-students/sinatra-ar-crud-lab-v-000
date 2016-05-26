require_relative '../../config/environment'
require_relative '../models/post.rb'  # probably not needed

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
    # create the post, save to db, then erb :index
    new_post = Post.new(params[:post])
    # @post.save # this causes problems


    # error seems to be when trying to creat or save a post object.. ie. activerecord is not happening?
    # @posts = Post.create(params[:post])  #this also causes problems

    @posts = Post.all
    erb :index
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do

  end
end
