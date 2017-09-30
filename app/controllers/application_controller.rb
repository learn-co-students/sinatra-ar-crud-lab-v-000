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
    Post.create(:name => params[:name], :content => params[:content])
    redirect '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @found_post = Post.find(params[:id])
    erb :action
  end

  get '/posts/:id/edit' do
    @found_post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @found_post = Post.find(params[:id])
    @found_post.update(:name => params[:name], :content => params[:content])
    redirect "/posts/#{@found_post.id}"
  end

  delete '/posts/:id/delete' do
    @post_to_be_deleted = Post.find(params[:id])
    @post_to_be_deleted.destroy
    erb :delete
  end




end

# it 'responds with a 200 status code' do
#   get "/posts/#{@post2.id}/edit"
#   expect(last_response.status).to eq(200)
# end

# params = {"name"=>"Hey Mama",
#  "content"=>"It's Kanye",
#  "button"=>""}

# Post.create(:name => post_name, :content => post_content)
