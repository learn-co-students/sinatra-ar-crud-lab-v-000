
require_relative '../../config/environment'
require 'pry'

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
    # binding.pry
    erb :new
  end

  post '/articles' do
    article = Article.create(title: params[:article_title], content: params[:article_content])
    article.save
    # binding.pry
    redirect to "/articles/#{article.id}"
    erb :index

  end

  get '/articles/:id' do
    @article = Article.find(params[:id].to_i)
    erb :show
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id].to_i)
    # binding.pry
    @article.update(title: params[:title])
    @article.update(content: params[:content])
    @article.save


    redirect to "/articles/#{@article.id}"
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id].to_i)
    erb :edit
  end


end
