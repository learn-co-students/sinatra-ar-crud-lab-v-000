
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end
  
  get '/articles/new' do
    erb :new
  end
  
  post '/articles' do
    @article = Article.create(params)

    redirect to "/articles/#{@article.id}"
  end
  
  get '/articles' do #index
    @articles = Article.all
    erb :index
  end
  
  get '/articles/:id' do #show
    @article = Article.find(params[:id])
    erb :show
  end
  
  get '/articles/:id/edit' do #update
    @article = Article.find(params[:id])
    erb :edit
  end
  
  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.title = params[:title]
    @article.content = params[:content]
    @article.save
    redirect "/articles/#{@article.id}"
  end
  
  delete '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
    @article.delete
    redirect to '/articles'
  end
  
end
