class StoriesController < ApplicationController
    skip_before_action :require_login, only: [:index, :show, :create, :image_upload]

    def index
        stories = Story.all
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
        # byebug
        story = Story.find_by(id: (params["id"]))
        file_url = Cloudinary::Uploader.upload(params[:image])
        story.image = file_url["url"]
        story.save
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
            render json: {error: "Unable to save your edits to this story at this time"}
        end
    end

    def destroy
        story.destroy
        render json: story #would rather send a 200 response of success
    end

    private

    def story_params
        params.permit(:id, :date, :transcriber, :contributor, :contact_email, :contact_phone, :summary, :story, :image )
    end

end
