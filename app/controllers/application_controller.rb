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
    new_post = Post.create(params)
    @posts = Post.all 
    erb :index
  end

  get '/posts' do 
    erb :index
  end


# Create the get '/posts/:id' controller action. This action should use Active Record to grab the 
# post with the id that is in the params and set it equal to @post. Then, it should render the 
# show.erb view page. That view should use erb to render the @post's title and content.

  get '/posts/:id' do 
    id = params[:id].to_i
    @post = Post.find_by id: id
    erb :show 
  end

  get '/posts/:id/edit' do 

    erb :edit
  end

  patch '/posts/:id' do 
    Post.update(params[:id], :user_name => '#{params["name"]}', :group => '#{params["content"]}')
    erb :show 
  end



end

