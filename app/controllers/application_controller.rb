
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles' do
    # binding.pry
    @articles = Article.all
    erb :'articles/index'
  end

  get '/articles/new' do
    # binding.pry 
    erb :'articles/new'
  end

  post '/articles' do
    # binding.pry
    @article = Article.new(title: params[:article][:title], content: params[:article][:content])
    erb :'articles/show'
  end

  get '/articles/:id' do
    # binding.pry
    @article = Article.find(params["id"])
    erb :'articles/show'
  end

  

  
end
