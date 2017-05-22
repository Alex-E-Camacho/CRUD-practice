def current_user
  session[:user_id] ? User.find_by(id: session[:user_id]) : nil
end

def logged_in?
  current_user ? true : false
end

def require_user
  if !logged_in?
    redirect '/login'
  end
end
