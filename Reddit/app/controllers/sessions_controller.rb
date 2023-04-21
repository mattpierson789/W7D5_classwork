class SessionsController < ApplicationController

    before_action :require_logged_in, only: [:destroy]

    before_action :require_logged_out, only: [:new, :create]

  
    def new 
        @user = User.new

        render :new

    end 


    def create 

        password = params[:user][:password] 
        username = params[:user][:username]

        @user = User.find_by_credentials(username, password)

        if @user && @user.is_password?(password)
            login!(@user)
            redirect_to users_url

        else 
            @user = User.new(username, password)   #Is this for passing the @user into the form?
            flash.new[:errors] = ["Invalid Credentials"]
            render :new
        end 


    end 


    def destroy 

        logout!

        redirect_to new_session_url

    end 

end 