
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
    @post = Post.find_by_id(params[:id])
    erb :show
  end

#####RESUME VIDEO AT 1:04:01#######
get '/posts/:id/edit' do #find a post by id and edit
  @post = Post.find_by_id(params[:id])
  erb :edit
end

  patch '/posts/:id' do #updates a post and then shows it
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save

    redirect "/posts/#{@post.id}"
  end


  delete '/posts/:id/delete' do #delete post by id
    @post = Post.find_by_id(params[:id])
    @post.destroy

    erb :delete
  end
end
