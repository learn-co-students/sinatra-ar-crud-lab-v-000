require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :new
  end

  post '/posts' do
    #binding.pry
    @post = Post.create(params)
    binding.pry
    erb :post
  end
end
