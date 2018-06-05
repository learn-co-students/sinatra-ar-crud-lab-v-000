
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/new' do
    erb :new
  end

  post '/posts' do
    #binding.pry
    Post.create(name: params[:posts][:name], content: params[:posts][:content])
    erb :index
  end


end
