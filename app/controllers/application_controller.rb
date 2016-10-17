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
    binding.pry
    @post = Post.create(name: params[:name], content: params[:content])
    redirect to '/posts'
  end

  get '/posts' do #loads index page
    @posts = Post.all
    erb :index
  end

  get '/posts/:id/edit' do
    erb :edit
  end

  delete '/posts/:id/delete' do


  end
end
