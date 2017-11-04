require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end



  get '/posts/new' do #new form
    erb :new
  end

  post '/posts' do #create a post
    @post = Post.create(params)
    redirect to '/posts'
  end

  get '/posts' do #load index page
    @posts= Post.all
    erb :index
  end

  get '/posts/:id' do  #loads show page
     @post = Post.find_by_id(params[:id])
     erb :show
   end

   get '/posts/:id/edit' do

     erb :edit
   end

   patch 'posts/:id' do
     
   end



end
