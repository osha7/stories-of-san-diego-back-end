class AuthController < ApplicationController
    skip_before_action :require_login, only: [:login, :auto_login]

    def auto_login
        # byebug
        if session_user
            render json: session_user
        else
            render json: {errors: "No User Logged In"}
        end
    end

    def user_is_authorized
        # byebug
        render json: {message: "You are authorized"}
    end
    
    def login
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            payload = {user_id: user.id}
            token = encode_token(payload)
            render json: {
                user: user,
                jwt: token,
                success: "Welcome back, #{user.username}"
            }
        else
            render json: {
                failure: "Log in failed! Username or password was invalid.  Please try again."
            }
        end
    end

end
