class CourseImagesController < ApplicationController
    include AuthorizationsHelper
    before_action :authorize_admin

    def create 
        @course_id = params[:course_id]

        @course_image = CourseImage.new(permitted_params)
        @course_image.course_id = @course_id

        if @course_image.save
            flash[:notice] = "Image succesffuly added"
            redirect_to edit_course_path(@course_id)
        else   
            flash[:now] = "Image was not saved"   
        end
    end
    def destroy
        @course_image = CourseImage.find(params[:id])
        @course_image.destroy 
        respond_to do |format|
            format.html {redirect_to :back, notice: 'Image has been deleted'}
            format.json {head :no_content}
            format.js {render layout: false}
        end
    end


    private
    def permitted_params
        params.require(:course_image).permit(:image)
    end
end
