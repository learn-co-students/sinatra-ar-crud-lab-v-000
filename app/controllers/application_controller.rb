
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles/:id' do
    @article = Article.find(params[:id].to_i)
    erb :show
  end

  post '/articles' do
    Article.create(params)
    @articles = Article.all
    erb :index
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id/edit' do
    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id].to_i).update(params)
    erb :show
  end

  delete '/articles/:id' do
    Article.find(params[:id].to_i).destroy
  end

end
