
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/index' do
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    Post.new(params)
    redirect 'index'
    binding.pry
  end

end
