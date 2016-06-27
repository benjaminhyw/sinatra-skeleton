get '/users/new' do
  erb :'users/register'
end

post '/users' do
  @user = User.creat(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])
  redirect '/'
end