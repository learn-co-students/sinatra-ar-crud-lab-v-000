require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts/:id' do

  end
  
  # post '/posts/new' do
  #
  # end
  #
  # post '/posts/:id' do
  #
  # end


end
