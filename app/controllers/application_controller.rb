
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :main
  end
  
  get '/articles/new' do 
    erb :new
  end 
  
  post '/articles' do 
    @article = Article.create(params)
    Article.all.each.with_index(1) do |article, index|
      article.update(id: index)
    end
    @articles = Article.all
    
    redirect "/articles/#{@article.id}"
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
  
  patch '/articles/:id' do
    article = Article.find(params[:id])
    article.update(title: params[:title]) unless params[:title].empty?
    article.update(content: params[:content]) unless params[:content].empty?
    @article = article
    redirect "/articles/#{@article.id}"
  end 
  
  delete '/articles/:id' do 
    article = Article.find(params[:id])
    article.destroy
    Article.all.each.with_index(1) do |value, index|
      article.update(id: index)
    end 
    @articles = Article.all
    redirect '/articles/index'
  end 
end
