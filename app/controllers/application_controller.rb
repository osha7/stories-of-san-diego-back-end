class ApplicationController < ActionController::API

    def home
        render json: {messege: "Server is up!"}
    end
    
end
