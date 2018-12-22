class SchoolInfoImagesController < ApplicationController
  include AuthorizationsHelper
  before_action :authorize_admin

  def create 
    @page_id = params[:page_id]

    @school_info_image = SchoolInfoImage.new(permitted_params)
    @school_info_image.school_info_id = @page_id

    if @school_info_image.save
        flash[:notice] = "Image succesffuly added"
        redirect_to :back
    else   
        flash[:alert] = "Image was not saved" 
        redirect_to :back 
    end
  end
  def destroy
    @school_info_image = SchoolInfoImage.find(params[:id])

    respond_to do |format|
        if @school_info_image.destroy 
            format.html {redirect_to :back, notice: 'Image has been deleted'}
            format.json {head :no_content}
            format.js {render layout: false}
        else
            format.html {redirect_to :back, alert: 'Delete image error'}
        end
    end
  end


  private
  def permitted_params
      params.require(:school_info_image).permit(:image)
  end
end
