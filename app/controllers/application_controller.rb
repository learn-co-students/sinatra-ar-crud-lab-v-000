
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/articles"
  end

  get '/articles' do
    #binding.pry
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do
    #@article = Article.new
    erb :new
  end

  post '/articles' do
    #binding.pry
    @article = Article.create(params)
    #binding.pry
    redirect to '/articles/#{Article.last.id}'
    #erb :index
  end

  get '/articles/:id' do
   #binding.pry
    @article = Article.find(params[:id])
    #binding.pry
    erb :show
  end

  get 'articles/:id/edit' do
    binding.pry
    @article = Article.find(params[:id])
    erb :edit
  end
end
