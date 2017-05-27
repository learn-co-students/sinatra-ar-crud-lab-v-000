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

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    erb :show
  end

  post '/posts' do
    @post = Post.create(params[:posts][-1])
    erb :show
  end

  get '/posts/:id/edit' do
    @id = :id
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    puts "##################################"
    hash = params[:posts][params[:id]]
    name = hash[:name]
    content = hash["content"]
    puts "This is the name " + name
    puts "This is the content " + content
    puts "This is the PARAMS: #{params[:posts][params[:id]]}" #{}"  #[:posts][:id] #{params[:posts][params[:id]]}"
    puts
    puts "##################################"
    @post = Post.find_by_id(params[:id]).update(:name => hash["name"], :content => hash["content"])
    erb :show
  end
end
