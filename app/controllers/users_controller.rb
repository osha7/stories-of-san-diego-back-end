class UsersController < ApplicationController

    def index
        users = User.all
        render json: {
            users: users
        }
    end

    def create
        user = User.create(user_params)
        if @user
            render json: {
                status: :created
                user: user
            }
        else
            render json: {
                status: 500
            }
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :password_digest)
    end

end
