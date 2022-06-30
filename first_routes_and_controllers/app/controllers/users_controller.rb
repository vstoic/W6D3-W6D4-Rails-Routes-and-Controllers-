class UsersController < ApplicationController
    
    def index
        @users = User.all
        render json: @users
    end

    def show
        @user = User.find(params[:id])  #searches tables for the user using :id
        render json: @user              #rendor returns the data in json format

    end
    
    def create 
        @user = User.new(user_params)            #creates a new user instance
            if @user.save                        # no bang because you dont want boolean. boolean scary
                redirect_to user_url(@user)      #if successfuly saved returns users profile
            else                                 #returns error if perams arent unique
                render json: @user.errors.full_messages, status: :unprocessable_entity
            end
    end
       
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)             #find user then use built in update method to make changes
            redirect_to user_url(@user)          #returns user link
        else                                     #if input is incorrect returns error
            render json: @user.errors.full_messages, status: :unprocessable_entity 
        end
    end

    def destroy
        @user = User.find(params[:id])          # finds user via id
        @user.destroy                           #calls built in destory method
        redirect_to users_url                   #redirects to the rest of the users
    end

    #users params method to find the username out of user?
    #makes things eaiser by making another method instead of writing it out every time
    def user_params
        params.require(:user).permit(:name, :email)        
    end
end