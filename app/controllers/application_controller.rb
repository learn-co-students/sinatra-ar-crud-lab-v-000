
require_relative '../../config/environment'

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
    @newpost = Post.create(:name => params[:post][:name], :content => params[:post][:content])
    @newpost.save
    erb :index
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end


  get '/posts/:id' do
    Post.find([:id])
  end

end
