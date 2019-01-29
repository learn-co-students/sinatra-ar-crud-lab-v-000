
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  post '/articles' do
    Article.create(params)
    @article = Article.last
    erb :show
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    # binding.pry
    @article = Article.find(params[:id])
    @article.update(:title => params["title"], :content => params["content"])
    erb :show
  end

  delete '/articles/:id' do
    Article.find(params[:id]).destroy
    @articles = Article.all
    erb :index
  end

end
