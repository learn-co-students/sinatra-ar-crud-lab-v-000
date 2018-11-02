
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/posts/new' do #loads new form
    erb :new
  end

  get '/posts' do #loads index page
    @posts = Post.all
    erb :index
  end


  post '/posts'do #creates a post
    @post = Post.create(params)
    redirect to "/posts"
    #params hash looks like this>>> {"name"=>"name of post", "content"=>"content for post"}

  end

  get '/posts/:id' do #loads show page
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do #find a post by id and edit
    @post = Post.find(params[:id])
    erb :edit
  end
#####RESUME VIDEO AT 1:04:01#######

  patch '/posts/:id' do #updates a post and then shows it
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save

    redirect "/posts/#{@post.id}"
  end

  delete '/posts/:id' do #delete post by id
    @post = Post.find(params[:id])
    @post.destroy

    redirect '/posts'
  end
end
