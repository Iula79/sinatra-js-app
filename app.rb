require 'rubygems'
require 'sinatra'

# missing do
get '/' do
  File.read('views/index.html')
  # File.read(File.join('public', 'index.html'))
  
end

# get 'favorites' do
#   response.header['Content-Type'] = 'application/json'
#   File.read('data.json')
# end

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
