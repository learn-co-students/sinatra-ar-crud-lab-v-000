require './config/environment'
class Post < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

end
