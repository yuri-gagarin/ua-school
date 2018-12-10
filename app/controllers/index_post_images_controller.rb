class IndexPostImagesController < ApplicationController
    include AuthorizationsHelper
    before_action :authorize_admin

    def destroy 
        @index_post_image = IndexPostImage.find(params[:id])
        if @index_post_image.destroy
            flash[:notice] = "Image has been deleted"
            redirect_to :back
        end
    end
end
