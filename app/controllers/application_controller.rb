
require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles/new' do
    erb :new
  end
  
  post '/articles' do
    # binding.pry
      @article = Article.create(params)
      @article.save
    erb :index
  end
  
  get '/articles' do
    @articles = Article.all
    erb :index
  end
  
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end
  
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end
  
  post '/articles/:id' do
    @article = Article.find_by(params[:id])
    erb :show
  end
  
  delete '/articles/:id' do
    
  end
  
end
