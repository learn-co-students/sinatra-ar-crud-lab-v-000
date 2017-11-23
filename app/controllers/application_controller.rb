require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

set :views, Proc.new { File.join(root, "../views/") }
#ask coach to explain, pulled this over from the other lab

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

#shouldn't there be one that's '/' and then erb :index?
    get '/posts/new' do #load form
      erb :new
    end


#show individual post
   post '/posts' do

      @post = Post.create(params[:post])
      redirect to '/posts'
    end

#index # lists all the posts
# missing a browser way to get to the next:
   get '/posts' do
     @posts = Post.all
     erb :index
   end

   get '/posts/:id' do
      @post = Post.find_by_id(params[:id])
      erb :show
   end
  #update, two parts : load the form so user can fill it out and 2/post that data to the db
    get '/posts/:id/edit' do # load the edit form
      @post = Post.find_by_id(params[:id])
      erb :edit
    end
# then update the blog post
    patch '/posts/:id' do
      @post = Post.find_by_id(params[:id])
      @post.name = params[:name]
      @post.content = params[:content]
      @post.save
      erb :show
    end


# delete

  delete '/posts/:id/delete' do
    @post = Post.find_by_id(params[:id])
    @post.delete
    erb :deleted # confirms the deletion
  end
end
