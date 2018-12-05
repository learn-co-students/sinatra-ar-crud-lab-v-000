require_relative '../../config/environment'
require_relative '../models/article.rb'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles/new' do
    erb :new
  end
  
  post '/articles' do
    new_article = Article.create(params)
    redirect to "/articles/#{new_article.id}"
  end
  
  get "/articles" do
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
  
  patch '/articles/:id' do  #updates a post
    @article = Article.find(params[:id])
    @article.update(title: params[:new_title], content: params[:new_content])
    @article.save

    redirect to "/articles/#{new_article.id}"
  end

  delete '/articles/:id/delete' do #delete action
    @article = Article.find_by_id(params[:id])
    @article.delete
    redirect to '/articles'
  end
end

