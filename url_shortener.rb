# Given a long URL
# return a short URL to the user
#
# Given a short URL
# we will redirect the user the to the previously stored long URL
require 'sinatra'
require 'sqlite3'

db = SQLite3::Database.new('urls.db')
db.execute "create table if not exists urls(short_url, long_url)"

get '/' do
  "<form action='/shorten' method='POST'>
    <input type='text' placeholder='Enter a URL' name='url' style='width: 600px' />
    <br/>
    <input type='submit' value='shorten' />
  </form>"
end

post "/shorten" do
  short_url = generate_short_url
  db.execute("insert into urls values(?,?)",short_url, params["url"])
  "you just shortened #{params['url']} to #{short_url}"
end

get "/:short_url" do |short_url|
  long_url = db.execute("select long_url from urls where short_url = ?", short_url)
  redirect long_url.first.first
end

def generate_short_url
  ('a'..'z').to_a.sample(6).join
end

















