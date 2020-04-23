
require_relative '../../config/environment'

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
    redirect to ("/articles/#{Article.last.id}")
    # erb :show
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

end
