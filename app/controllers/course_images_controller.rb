class CourseImagesController < ApplicationController
    include AuthorizationsHelper
    before_action :authenticate_user!
    before_action :authorize_admin
    def destroy
        @course_image = CourseImage.find(params[:id])
        @course_image.destroy 
        respond_to do |format|
            format.html {redirect_to :back, notice: 'Image has been deleted'}
            format.json {head :no_content}
            format.js {render layout: false}
        end
    end
end
