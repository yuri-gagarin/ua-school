class GalleryImagesController < ApplicationController
    include AuthorizationsHelper
    before_action :authorize_admin

    def create 
        @gallery_id = params[:gallery_id]

        @gallery_image = GalleryImage.new(permitted_params)
        @gallery_image.gallery_id = @gallery_id

        @gallery = Gallery.find(params[:gallery_id])
        if @gallery_image.save
            flash[:notice] = "Image succesffuly added"
            redirect_to edit_gallery_path(@gallery_id)
        else   
            flash[:now] = "Image was not saved"   
        end
    end

    def destroy 
        @gallery_image = GalleryImage.find(params[:id])
        @gallery_image.destroy
        respond_to do |format|
            format.html {redirect_to :back, notice: "Galley has been deleted"}
            format.json {head :no_content}
            format.js {render layout: false}
        end
    end

    private 
    
    def permitted_params
        params.require(:gallery_image).permit(:gallery_id, :description, :image)
    end
end
