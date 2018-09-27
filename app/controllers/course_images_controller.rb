class CourseImagesController < ApplicationController
    include AuthorizationsHelper

    before_action :set_course
    before_action :authenticate_user!
    before_action :authorize_admin


    def create
        images = []
        images += @course.images
        images += images_params[:images]
        @course.images = images
        if @course.save
            flash[:success] = "uploaded images"
            redirect_to :back
        else  
            flash[:error] = "failed image upload"
            redirect_to :back
        end
    end

    def destroy
        if (@course.images.size == 1 && params[:id].to_i == 0)
            @course.remove_images!
        else  
            remain_images = @course.images
            deleted_image = remain_images.delete_at(params[:id].to_i)
            deleted_image.remove!
            @course.images = remain_images
        end

        if @course.save 
            flash.now[:success] = "deleted image"
            redirect_to :back
        else 
            flash.now[:error] = "failed image delete"
            redirect_to :back
        end
    end


    private 
    def set_course
        @course = Course.find(params[:course_id])
    end

    def add_more_images(new_images)
        images += @course.images
        images += new_images
        @course.images = images 
    end

    def images_params
        params.require(:course).permit({images: []})
    end
end
