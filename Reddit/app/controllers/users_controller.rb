class UsersController < ApplicationController

    before_action :require_logged_in, only: [:show]

    def new 
        @user = User.new 
        render :new

    end 


    def create

        @user = User.new(user_params)

        if @user.save
            login(@user)
            redirect_to user_url(@user)
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end

    end 


    def show
        @user = User.find(params[:id])
        render :show
    end

    def index
        @users = User.all
        render :index
    end


    def edit 
        @user = User.find(params[:id])
        render :edit

    end 


    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to new_session_url

    end 

    private 
    
    def user_params 
        params.require(:user).permit(:username, :password)
    end

end 