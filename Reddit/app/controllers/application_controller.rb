class ApplicationController < ActionController::Base


    helper_method :cureent_user, :logged_in?

#Chr(r)LLL

def current_user

    @surrent_user = User.find_by(session_token: session[:session_token])

end 

def require_logged_in


redirect_to new_session_url unless logged_in?


end

def require_logged_out

redirect_to users_url if logged_in?
    
end 


def logged_in? 

    !!current_user  #no @ symbol

end 

def login!(user)

@current_user = user                    #why do we use @current user and then sometimes not

 session[:session_token] = user.reset_session_token
 
end 

def logout!


current_user.reset_session_token

current_user = nil 
session_token = nil


end 

