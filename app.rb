require_relative 'config/environment'

class App < Sinatra::Base

  get '/articles/new' do
    erb :new.erb
  end

  post '/articles' do
    Model.create(title: params[:article_title], content: params[:article_content])
    erb :index.erb
  end

  # Add your post route and action below

end
