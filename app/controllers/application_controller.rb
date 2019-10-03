
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
    # binding.pry
   get '/articles/new' do
     @article = Article.new
     erb :new
   end
    binding.pru 
   get '/article' do
     redirects to '/articles/:id'
   end








end
