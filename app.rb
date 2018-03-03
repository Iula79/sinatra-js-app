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
  body_par = request.body.read
  data = JSON.parse(body_par)["params"]
  url = "http://www.omdbapi.com/?apikey=#{ENV['MY_MOVIE_KEY']}&s=#{data}"
  uri = URI.parse(URI.encode(url))
  api_response = Net::HTTP.get(uri)
  return api_response
end

#missing / in front of favorites
get '/favorites' do
  response.header['Content-Type'] = 'application/json'
  if File.read('data.json')
    return File.read('data.json')
  end
end

# it's a post request... 
post '/favorites' do
  body_par = request.body.read
  data = JSON.parse(body_par)
  puts File.read('data.json').length 
  file = JSON.parse(File.read('data.json'))
  # unless params[:name] && params[:oid]
  #   return 'Invalid Request'
  #   #missing end 
  # end
  # 
  movie = { name: data["Title"], id: data["imdbID"] }
  file << movie
  File.write('data.json',JSON.pretty_generate(file))
  movie.to_json
  # else
 
  # end
end
