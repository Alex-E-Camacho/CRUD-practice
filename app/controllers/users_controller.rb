get '/users' do
  "This is the /users get route"
end

get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  @user = User.new(params["user"])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :'/users/new'
  end
end

get '/users/:id' do
  require_user
  @user = User.find_by(id: params[:id])
  if current_user == @user
    erb :'/users/show'
  else
    redirect '/login'
  end
end

get '/users/:id/edit' do
  "this is the users edit route"
end
