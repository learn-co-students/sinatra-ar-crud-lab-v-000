require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

configure do
  set :public_folder, 'public'
  set :views, 'app/views'
end


get '/' do 
    erb :index
end


get '/posts/new' do
    erb :new
end
  
post '/posts' do
     Post.create(:name => params[:name], :content => params[:content])
     erb :index
end

get '/posts' do
    erb :index
end

get '/posts/:id' do
    @id = params[:id]
    erb :show
end


get '/posts/:id/edit' do
     @id = params[:id]
     erb :edit
end


patch '/posts/:id' do
      
      @id = params[:id]
      Post.find(@id).update(:name => params[:name], :content => params[:content])
      erb :show

end

delete '/posts/:id/delete' do
  @deleted_post = Post.find(params[:id])
  Post.delete(params[:id])
  erb :delete
end


end#eoc