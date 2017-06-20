require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    post = Post.new(params)
    post.save
    erb :index
  end

  get '/posts' do
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
     @post = Post.find(params[:id])
     params.each do |key, value|
       if  key == :id
       elsif @post.has_attribute?(key)
         @post.send("#{key}=", value)
       end
     end
     @post.save
     erb :index
   end

   delete '/posts/:id/delete' do
     @delete_post = Post.find(params[:id])
     @delete_post.delete
     erb :delete
   end

end
