
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/articles"
  end

  get '/articles' do
    #binding.pry
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do
    #@article = Article.new
    erb :new
  end

  post '/articles' do
    @article = Article.create(params)
    redirect to "/articles/#{Article.last.id}"
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.title = params[:title]
    @article.content = params[:content]
    @article.save
    erb :show
  end

  delete '/articles/:id/delete' do
    @article = Article.find(params[:id])
    @article.delete
    redirect to '/articles'
  end
end
