get '/users/new' do
  if request.xhr?
    erb :'users/register', layout: false
  else
    erb :'users/register'
  end
end

post '/users' do
  @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])

  if @user.save
    login(@user)
    redirect '/'
  else
    @errors = @user.errors.full_messages  
    erb :'users/register'
  end
end

get "/users/:id" do
  @user = User.find_by_id(params[:id])
  erb :'/users/show'
end

get "/users/:id/edit" do
  @user = User.find_by_id(params[:id])
  erb :'/users/edit'
end

get '/login' do
  if request.xhr?
    erb :'users/login', layout: false
  else
    erb :'users/login'
  end
end

post '/login' do
  @user = User.authenticate(params[:email], params[:password])
  if @user
    login(@user)
    redirect '/'
  else
    @errors = "Incorrect info"
    erb :'users/login'
  end
end

get '/logout' do 
  session[:user_id] = nil
  redirect '/'
end