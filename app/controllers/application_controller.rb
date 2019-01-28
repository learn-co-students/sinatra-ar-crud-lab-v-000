
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

  end

  post '/articles' do
    @article = Article.create(params)
    "#{@article.name}: #{@article.content}"
  end

  get '/articles/:id/edit' do
    erb :edit
  end

  delete '/articles/:id' do

  end

end
