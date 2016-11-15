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
    @posts = []
    post = Post.create(name: params[:name], content: params[:content])
    @posts << post
    erb :index
  end

  get '/posts' do
    @posts = []
    Post.find_each do |post|
      @posts << post
    end
    erb :index
  end
end
