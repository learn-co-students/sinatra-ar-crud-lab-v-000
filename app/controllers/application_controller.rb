
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

#CREATE

  get '/' do
    redirect to '/posts/new'
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    # @post =
    @post = Post.create(params) # creates the blog post and saves it to the database
    redirect to '/posts'
  end

#READ
  get '/posts' do
    @post = Post.all # use Active Record to grab all of the posts and store them in an instance variable
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    # @post = Post.find(params[:id])
    erb :show
  end

#UPDATE
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
   @post = Post.find(params[:id])
   @post.destroy
  #  redirect '/posts'
   erb :delete
 end

end
