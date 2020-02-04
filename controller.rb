require('sinatra')
require('sinatra/contrib/all') if development?
require('pry-byebug')

require_relative('./models/film')
also_reload('./models/*')

get '/index' do
  @films = Film.all()
  erb(:index)
end

get '/film/:film_id' do
  @film = Film.find(params[:film_id].to_i)
  erb(:film)
end
