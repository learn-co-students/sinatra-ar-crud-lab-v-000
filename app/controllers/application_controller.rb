
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :new
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @post1 = Post.create(:name => post_name, :content => post_content)
    @post2 = Post.create(:name => "second post", :content => "i'm a really good blogger")

    erb :index
  end


end
