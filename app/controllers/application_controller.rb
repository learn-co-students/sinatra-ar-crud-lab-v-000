require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end
  
  get '/articles' do
    @articles = Article.all
    erb :index
  end
  
  get '/articles/new' do 
    erb :new
  end
  
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end
  
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end
  
  post '/articles' do
    article = Article.create(params)
    redirect to "/articles/#{article.id}"
  end
  
  patch '/articles/:id' do 
    binding.pry
    old_article = Article.find(params[:id])
    # Somehow, I need to update this article without params["_method"].
  end
  
end
