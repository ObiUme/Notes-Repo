class UsersController < ApplicationController

    def index
        users = User.all
        render json: users
    end

    def create
        user = User.create!(user_params)
        session[:user_id] = user.id
        render json: user, status: :created
    end

    def show  
        render json: @user    
    end

    def update
        @user.update!(user_params)
        render json: @user, status: :accepted   
    end

    def destroy
        @user.destroy
        head :no_content
    end

    private

    def user_params
        params.permit(:first_name, :last_name, :username, :password)
    end
end
