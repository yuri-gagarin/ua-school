class SchoolInfoImageController < ApplicationController
  nclude AuthorizationsHelper
  before_action :authorize_admin

  def create 
      @school_info_page_id = params[:school_info_page_id]

      @school_info_page_image = SchoolInfoPageImage.new(permitted_params)
      @school_info_page_image.school_info_page_id = @school_info_page_id

      if @school_info_page_image.save
          flash[:notice] = "Image succesffuly added"
          redirect_to edit_school_info_page_path(@school_info_page_id)
      else   
          flash[:now] = "Image was not saved"   
      end
  end
  def destroy
      @school_info_page_image = school_info_pageImage.find(params[:id])
      @school_info_page_image.destroy 
      respond_to do |format|
          format.html {redirect_to :back, notice: 'Image has been deleted'}
          format.json {head :no_content}
          format.js {render layout: false}
      end
  end


  private
  def permitted_params
      params.require(:school_info_page_image).permit(:image)
  end
end
