require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
    end
    get '/' do
        redirect '/posts/new'
    end

    get '/posts/new' do 
        erb :new
    end

    post '/posts' do
        post = Post.find_or_create_by(name: params[:name])
        post.content = params[:content]
        post.save
        @posts = Post.all
        erb :index
    end

    get '/posts' do
        @posts = Post.all
        erb :index
    end

    get '/posts/:id' do
        @post = Post.find(params[:id])
        erb :show
    end

    patch '/posts/:id' do
        
        @post = Post.find(params[:id])
        @post.update(name: params[:name], content: params[:content])
        
        erb :show
    end

    get '/posts/:id/edit' do
        @post = Post.find(params[:id])
        
        erb :edit
    end
    
    delete '/posts/:id' do
        @post = Post.find(params[:id])
        @post.delete 
        
        erb :deleted
    end
end