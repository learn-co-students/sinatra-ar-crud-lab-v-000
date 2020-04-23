
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
    redirect to "/articles/#{Article.last.id}"
    erb :show
  end

  get '/articles' do
    # @articles = Article.all
    erb :index
  end

#The first 2 tests passes with this code below, but fails without it. 4/22/20, DJL
  get '/articles/:id' do
    @article = Article.find([params:id])
    erb :index
  end

end
