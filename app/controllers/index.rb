get '/' do
 @user = User.find_by_id(params[:id])
 erb :index
end

