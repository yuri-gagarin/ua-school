class TopicImagesController < ApplicationController
  include AuthorizationsHelper
  before_action :authorize_admin

  def create 
      @topic_id = params[:topic_id]

      @topic_image = TopicImage.new(permitted_params)
      @topic_image.topic_id = @topic_id

      if @topic_image.save
          flash[:notice] = "Image succesffuly added"
          redirect_to edit_topic_path(@topic_id)
      else   
          flash[:now] = "Image was not saved"   
      end
  end

  def destroy 
      @topic_image = TopicImage.find(params[:id])
      @topic_image.destroy
      respond_to do |format|
          format.html {redirect_to :back, notice: "Image has been deleted"}
          format.json {head :no_content}
          format.js {render layout: false}
      end
  end

  private 
  
  def permitted_params
      params.require(:topic_image).permit(:image)
  end
end
