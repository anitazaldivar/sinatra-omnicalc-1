require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

get '/square/new' do
  erb(:new_square_calc)
end

get '/square/results' do
  @the_number = params.fetch("number")
  @the_result = params.fetch("number").to_f**2
  erb(:square_results)
end
