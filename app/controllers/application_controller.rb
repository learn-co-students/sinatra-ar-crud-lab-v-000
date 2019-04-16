
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    @article = Article.new
    erb :new
  end


  get '/articles' do
    @article = Article.all
    erb :index
  end


  post '/articles' do
    Article.create(title: params[:title], content: params[:content])
    erb :index
  end


end

# check issues flag on github for config.rg
# https://github.com/learn-co-students/sinatra-ar-crud-lab-v-000/issues
