
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/articles"
  end
  
  # CRUD: CREATE READ UPDATE DELETE
  
  # READ - index
  get '/articles' do
    @articles = Article.all
    erb :index
  end
  
  # CREATE - new (REMEMBER TO PUT BEFORE ':id')
  get "/articles/new" do
    @article = Article.new
    erb :new
  end

  # READ - show
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end
  
  
  # CREATE - post
  post "/articles" do
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end
  
  # UPDATE - edit
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end
  
  # UPDATE - patch
  patch "/articles/:id" do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{ @article.id }"
  end
  
  # DELETE - destroy
  delete '/articles/:id' do
    Article.destroy(params[:id])
    redirect to "/articles"
  end
  
end
