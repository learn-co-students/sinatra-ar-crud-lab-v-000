
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

	get '/posts/new' do
		erb :'posts/new'
	end
	
	post '/posts' do
		post_ = Post.create
		post_.name = params[:post][:name]
		post_.content = params[:post][:content]

		post_.save

		@post = post_

		erb :'posts/index'
	end
end
