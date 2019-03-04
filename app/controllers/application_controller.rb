require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end
  
  get '/articles/new' do
    erb :new
  end
  
  post '/articles' do
    @article= Article.create(params)
    erb :index
  end
  
  get '/articles' do
    @articles= Article.all
    erb :show
  end
  
  get '/articles/:id' do
    @id= params[:id]
    @article= Article.find_by(id: @id)
    erb :show
  end
  
end
