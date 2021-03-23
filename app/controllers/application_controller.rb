
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/articles"
  end

  get '/articles/new' do
    erb :new
  end
 
  get '/articles' do
    @articles = Article.all
    erb :index 
  end

  post '/articles' do
    @article = Article.create(title: params[:title], content: params[:content])
    redirect to "/articles/#{@article.id}"
  end

  get '/articles/:id' do 
    @article = Article.find(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end    #renders edit page, form sends a patch request below
  

  patch '/articles/:id' do #controller action will find the instance of the model to update, using the id from params, update and save that instance.
    @article = Article.find(params[:id])
    @article.update(title: params[:title],content: params[:content])
    @article.save
    redirect to "/articles/#{@article.id}"
  end
  
  delete '/articles/:id/delete' do 
  	@article = Article.find(params[:id])
    @article.delete
    erb :show
  end
 

end
