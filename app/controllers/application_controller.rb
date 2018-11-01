
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts' do #loads index page
    @posts = Post.all
    erb :index
  end

  get '/posts/new' do #loads new form
    erb :new
  end

  post '/posts'do #creates a post
    @post = Post.create(params)
    redirect to "/posts/#{@post.id}"
    #params hash looks like this>>> {"name"=>"name of post", "content"=>"content for post"}
  end

####START AT 30 MIN MARK IN VIDEO LECTURE#####

  get '/posts/:id' do #loads show page
    @post = Post.find(params[:id])
    erb :show
  end
end
