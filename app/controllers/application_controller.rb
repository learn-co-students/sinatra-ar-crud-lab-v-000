
require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
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

  end

  get '/articles/:id' do
    @article = Article.find(params[:id].to_i)
    erb :show
  end


end
