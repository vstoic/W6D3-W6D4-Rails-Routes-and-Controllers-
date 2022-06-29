class UsersController < ApplicationController
    def index
        @users = User.all
        render json: @users
    end
    #rendor returns the data in json format?
    def show
        @user = User.find(params[:username])
        render json: @user
    end
    
    def create 
        @user = User.new(user_params)
            if @user.save
                redirect_to user_url(@user)
            else
                render json: @chirp.errors.full_messages, status: :unprocessable_entity
            end
    end


    #users params method to find the username out of user?
    def user_params
        params.require(:user).permit(:username)
    end
end