class StoriesController < ApplicationController
    skip_before_action :require_login, only: [:index, :show, :create, :image_upload, :edit, :update, :destroy]

    def index
        stories = Story.all.sort_by{ |story| -story[:id]}
        render json: {
            stories: stories
        }
    end

    def show
        story = Story.find_by(id: params[:id])
        render json: {
            story: story
        }
    end

    def new
    end

    def image_upload
        story = Story.find_by(id: (params["id"]))
        # byebug
        file_url = Cloudinary::Uploader.upload(params[:image])
        story.image = file_url["url"]
        
        if story.save
            render json: story
        else
            render json: {error: "Unable to save image at this time"}
        end

    end

    def create
        # byebug
        story = Story.create(story_params)

        if story.valid?
            render json: story
        else
            render json: {error: "Unable to save story at this time"}
        end
    end

    def edit
        story = Story.find_by(id: params[:id])
    end

    def update
        story = Story.find_by(id: params[:id])
        story.update(story_params)
        
        if story.valid?
            story.save
            render json: story
        else
            render json: {error: "Unable to save your edits to this story, please try again or contact your Web Master."}
        end
    end

    def destroy
        # byebug
        story = Story.find_by(id: params[:id])
        story.destroy
        render json: story #would rather send a 200 response of success
        # render json: {}, status: 200
    end

    private

    def story_params
        params.permit(:id, :date, :transcriber, :contributor, :contact_email, :contact_phone, :summary, :story, :image )
    end

end
