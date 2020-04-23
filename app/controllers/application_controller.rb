
require_relative '../../config/environment'
require 'sinatra'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id/edit' do
    @article2 = Article.find(params[:id])
    # binding.pry
    erb :edit
  end

  patch '/articles/:id' do
    @article2 = Article.find(params[:id])
    @article2.title = params[:title]
    @article2.content = params[:content]
    @article2.save
    redirect to "/articles/#{@article2.id}"
  end

  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.delete
    redirect to '/articles'
  end

end
