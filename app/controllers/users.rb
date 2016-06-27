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

post '/login' do
  @user = User.authenticate(params[:email], params[:password])
  if @user
    login(@user)
    redirect '/'
  else
    erb :login
  end
end

get '/logout' do 
  session[:user_id] = nil
  redirect '/'
end