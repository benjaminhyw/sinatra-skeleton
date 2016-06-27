get '/users/new' do
  erb :'users/register'
end

post '/users' do
  @user = User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])
  redirect '/'
end

get '/login' do
  erb :'users/login'
end