class GradeImagesController < ApplicationController
    include AuthorizationsHelper
    before_action :authorize_admin

    def create 
        @grade_id = params[:grade_id]

        @grade_image =  GradeImage.new(permitted_params)
        @grade_image.grade_id = @grade_id

        @grade = Grade.find(params[:grade_id])
        if @grade_image.save
            flash[:notice] = "Image succesffuly added"
            redirect_to edit_grade_path(@grade_id)
        else   
            flash[:now] = "Image was not saved"   
        end
    end

    def destroy 
        @grade_image = GradeImage.find(params[:id])
        @grade_image.destroy
        respond_to do |format|
            format.html {redirect_to :back, notice: "Image has been deleted"}
            format.json {head :no_content}
            format.js {render layout: false}
        end
    end

    private 
    
    def permitted_params
        params.require(:grade_image).permit(:grade_id, :description, :image)
    end
end
