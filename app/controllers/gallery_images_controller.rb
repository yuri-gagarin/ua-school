class GalleryImagesController < ApplicationController
    include AuthorizationsHelper
    before_action :authorize_admin

    def destroy 
        @gallery_image = GalleryImage.find(params[:id])
        @gallery_image.destroy
        respond_to do |format|
            format.html {redirect_to :back, notice: "Galley has been deleted"}
            format.json {head :no_content}
            format.js {render layout: false}
        end
    end
end
