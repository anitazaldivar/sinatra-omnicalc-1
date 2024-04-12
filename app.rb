require "sinatra"
require "sinatra/reloader"
require "active_support/all"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

get('/square/new') do
  erb(:new_square_calc)
end

get('/square/results') do
  @the_number = params.fetch("number")
  @the_result = params.fetch("number").to_f**2
  erb(:square_results)
end

get('/square_root/new') do
  erb(:new_square_root_calc)
end

get('/square_root/results') do
  @the_number = params.fetch("user_number")
  @the_result = @the_number.to_f**0.5
  erb(:square_root_results)
end

get('/payment/new') do
  erb(:new_payment)
end

get('/payment/results') do
  @the_apr = params.fetch("user_apr").to_f.to_fs(:percentage, { :precision => 4 } )
  @the_years = params.fetch("user_years")
  @the_principal = params.fetch("user_pv").to_f.to_fs(:currency, { :precision => 2 })

  r = params.fetch("user_apr").to_f/100/12
  n = @the_years.to_i*12
  pv = params.fetch("user_pv").to_i
  numerator = r*pv
  denominator = (1-(1+r)**(-n))
  @the_payment = numerator/denominator
  @the_payment = @the_payment.to_f.to_fs(:currency, { :precision => 2 })
  erb(:payment_results)
end
