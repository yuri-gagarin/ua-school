class WorkshopImagesController < ApplicationController
    include AuthorizationsHelper
    before_action :authorize_admin

    def create 
        @workshop_id = params[:workshop_id]

        @workshop_image = WorkshopImage.new(permitted_params)
        @workshop_image.workshop_id = @workshop_id

        puts @workshop_image.valid?
        @workshop_image.errors.messages
        if @workshop_image.save
            flash[:notice] = "Image succesffuly added"
            redirect_to edit_workshop_path(@workshop_id)
        else   
            flash[:now] = "Image was not saved"   
        end
    end

    def destroy 
        @workshop_image = WorkshopImage.find(params[:id])
        @workshop_image.destroy
        respond_to do |format|
            format.html {redirect_to :back, notice: "Image has been deleted"}
            format.json {head :no_content}
            format.js {render layout: false}
        end
    end

    private 
    
    def permitted_params
        params.require(:workshop_image).permit(:workshop_id, :image)
    end
end
