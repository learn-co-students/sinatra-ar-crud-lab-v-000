require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  get '/registrations/signup/' do #take in all the input
   erb :signup.erb
  end

  get '/posts/' do #take in all the input
    @posts = Post.all
   erb :index
  end

  get '/posts/new' do
    erb :new
  end

 post '/posts' do
   new_post = Post.create(params)
   # new_post.save   ??
   redirect to '/posts'
 end

  get '/posts/:id' do
    # use params to get id of the post to 'show'
    # @post = Post.find(???params?)
  erb :show
  end

  get '/posts/:id/edit' do
    erb :edit
   end

  patch 'posts/:id' do
    # use params to get id of the post to 'edit'
    # @post = Post.find(???params?)
    # update / patch the @post wiht the data from params

    erb :show
  end

  delete 'posts/:id/delete' do
    # binding.pry   to see params["name"]
    # @post.name  = params["name"]  example
    # use params to get id of the post to 'delete'
    # @post = Post.find(???params?)
    erb :deleted
  end

end
