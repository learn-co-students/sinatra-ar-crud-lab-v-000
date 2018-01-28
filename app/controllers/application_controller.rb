require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

# shows index page
  get '/' do
    erb :index
  end

# shows new page which has a form to create a post
  get '/posts/new' do
    erb :new
  end

#creates a post
  post '/posts' do
    @post = Post.create(params)
    redirect to '/posts'
  end

#shows all posts on the index page
  get '/posts' do
    @posts = Post.all
    erb :index
  end

#shows all posts on the index page
    get '/posts/:id' do
      erb :show
    end
end
