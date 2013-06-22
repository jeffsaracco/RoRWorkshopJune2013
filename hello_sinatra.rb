require 'sinatra'

get '/hi' do
  "Hello World!"
end

# localhost:4567/hi/jeff
get '/hi/:username' do |name|
  "Hello #{name}"
end
