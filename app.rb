require 'dotenv'
Dotenv.load
require 'rubygems'
require 'sinatra'
require 'net/http'
require 'net/https'
require 'json'

# missing do
get '/' do
  File.read('public/index.html')
  # File.read(File.join('public', 'index.html')) 
end

post '/movies' do
  url = "http://www.omdbapi.com/?apikey=#{ENV['MY_MOVIE_KEY']}&s=hello"
  uri = URI.parse(URI.encode(url))
  api_response = Net::HTTP.get(uri)
  return api_response
end

#missing / in front of favorites
get '/favorites' do
  response.header['Content-Type'] = 'application/json'
  File.read('data.json')
end

# get '/favorites' do
#   file = JSON.parse(File.read('data.json'))
#   unless params[:name] && params[:oid]
#     return 'Invalid Request'
#   end
#   movie = { name: params[:name], oid: params[:oid] }
#   file << movie
#   File.write('data.json',JSON.pretty_generate(file))
#   movie.to_json
# end
