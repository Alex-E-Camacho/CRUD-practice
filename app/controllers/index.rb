get '/' do
  erb :index
end

get '/login' do
  erb :login
end

post '/login' do
  @user = User.find_by(email: params["email"])
  if @user && @user.authenticate(params["password"])
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = ["Email and/or password incorrect"]
    erb :login
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
