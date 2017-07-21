require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end



  get '/posts/new' do
    binding.pry
    #@post2 = Post.new(params)
    #post1 = post1
    #@post2 = post2
    #post1.save
    #post2.save
  erb :new
  end

  post '/posts' do
    @post = Post.create(params)#how to Create in AR
    erb :index
  end
end
