
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/articles/new' do #loading new.erb file. Provides a form.
    erb :'/articles/new'
  end 
  
  post '/articles' do #redirecting back to list of articles
    @article = Article.create(params) #meta programs the hash of params (title and content). Create starts new article and saves it. 
    @id = @article.id
    redirect "/articles/#{@id}" #string interpolation only works with double quotes
  end 
  
  get '/articles' do 
    @article = Article.all
    erb :'/articles/index'
  end
  
  get "/articles/:id" do 
    @article = Article.find(params[:id])
    erb :'/articles/show'
  end 

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :"/articles/edit"
  end
  
  patch "/articles/:id" do
    @article = Article.find(params[:id])
    @article.update(:title => params[:title], :content => params[:content])
    #binding.pry
    redirect "/articles/#{@article.id}"
  end
  
  delete "/articles/:id/delete" do
    @article = Article.find(params[:id])
    @article.destroy

    redirect "/articles"
  end
end
