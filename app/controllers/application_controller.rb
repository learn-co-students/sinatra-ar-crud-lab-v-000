
require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do
    erb :new
    #binding.pry
  end

  post '/posts' do
    #binding.pry
    Post.create(:name => params[:post][:name], :content => params[:post][:content])

    #binding.pry

  end



end
