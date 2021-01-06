class MainController < ApplicationController
    # before_action :force_json, only: :search
    skip_before_action :require_login, only: [:index, :search, :force_json]
    
    def index
        # @q = Story.ransack(params[:q])
        # @stories = @q.result
    end

    def search
        byebug
        @stories = Story.ransack(story_cont: params[:q]).result(distinct: true).limit(10)
        render json: {
            stories: @stories
        }
    end

    private

    # def force_json
    #     request.format = :json
    # end

end
