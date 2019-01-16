
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

  post '/articles' do
    title = params[:title]
    content = params[:content]
    article = Article.create(title: title, content: content)
    redirect "/articles/#{article.id}"
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    new_title = params[:title]
    new_content = params[:content]
    @article.update(title:new_title, content: new_content)
    redirect "/articles/#{article.id}"
  end

  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.delete 
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end



end
