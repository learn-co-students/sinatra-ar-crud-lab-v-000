
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

<<<<<<< HEAD
  get '/article/new' do
    erb :new
  end

  post '/articles' do
    Article.create(params)
    redirect '/articles'
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do
    @article = Article.find(params["id"])
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find(params["id"])
    erb :edit
  end

  patch '/articles/:id' do  #updates a post
    @article = Article.find_by_id(params[:id])
=======

  patch '/articles/:id' do  #updates a post
    @article = Post.find_by_id(params[:id])
>>>>>>> 8e6954d7d13b3ac4eeebdc36b4c601256e0581cd
    @article.name = params[:name]
    @article.content = params[:content]
    @article.save
    erb :show
  end


  delete '/articles/:id/delete' do #delete action
    @article = Article.find_by_id(params[:id])
    @article.delete
    redirect to '/articles'
  end


end
