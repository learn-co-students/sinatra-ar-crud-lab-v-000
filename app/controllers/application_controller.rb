
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    params.each do |post|
      Post.new(post[:name],post[:content])
    end
    @posts = Post.all

    erb :index
  end
end
