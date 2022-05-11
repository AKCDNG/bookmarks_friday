require 'pg'
require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/list'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello World'
  end

  get '/bookmarks' do
    @bookmark = List.all
    erb :bookmarks
  end

  post '/add' do
    List.add(params[:add_bookmark])
    redirect '/bookmarks'
  end
  
  run! if app_file == $0
end