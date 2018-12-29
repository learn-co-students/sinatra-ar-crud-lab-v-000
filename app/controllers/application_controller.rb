
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/articles" do
    @articles = Article.all
    erb :index
  end
  
  get '/articles/new' do
    erb :new
  end
  
  get "/articles/:id/edit" do
    @article = Article.find(params[:id])
    erb :edit
  end
  
  get "/articles/:id" do
    @article = Article.find(params[:id])
    erb :show
  end
  
  post "/articles" do
    x = Article.create(params[:article])
    x.save
    redirect "articles/#{x.id}"
  end
  
  patch "/articles/:id" do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect "/articles/#{@article.id}"
  end
  
  delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect "/articles"
  end
end
