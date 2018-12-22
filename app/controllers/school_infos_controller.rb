class SchoolInfosController < ApplicationController
  include AuthorizationsHelper
  before_action :authorize_admin, except: [:show]
  before_filter :find_school_info, only: [:show, :edit, :update, :destroy]


  def index
    @school_infos = SchoolInfo.all
  end

  def show
  end

  def new
    @school_info = SchoolInfo.new
  end

  def edit
    @school_info_image = SchoolInfoImage.new
  end

  def create
    @school_info = SchoolInfo.new
    page_params = school_info_params
    @school_info.title = page_params[:title]
    @school_info.description = page_params[:description]
    @school_info.page_type = page_params[:page_type].to_i

    respond_to do |format|
      if @school_info.save 
        format.html do 
          flash[:notice] = 'School info page was successfully created.'
          redirect_to admin_general_info_path
        end
        format.json do 
          render action: 'show', status: 'created', location: @school_info
        end
      else 
        format.html do 
          flash.now[:alert] = "There was an error in createing iformational page"
          render :new
        end
        format.json do 
          render json: @school_info.errors, status: :unprocessable_entity
        end 
      end
    end
  end

  def update

    @school_info.asssign_attributes(school_info_params)
    @school_info.page_type = params[:page_type].to_i

    respond_to do |format|
      if @school_info.save
        format.html do 
          flash[:notice] = "School info page was successfully updated"
          redirect_to admin_general_info_path
        end
        format.json do 
          render action: 'general_info', controller: 'admin', status: 'created', json: @school_info
        end
      else
        format.html do 
          flash.now[:alert] = "Error in updated the informational page"
          render :edit
        end
        format.json do 
          render action: 'general_info', controller: 'admin', status: :unprocessable_entity
        end
      end
    end  
  end

  # DELETE /school_infos/1
  def destroy
    respond_to do |format|
      if @school_info.destroy
        format.html do 
          flash[:notice] = "Informational page was deleted"
          redirect_to admin_general_info_path
        end
        format.json do 
          render action: 'general_info', controller: 'admin', json: @school_info, status: :deleted
        end
      else  
        format.html do 
          flash[:alert] = "Error in deleting the page"
          redirect_to admin_general_info_path 
        end
        format.json do 
          render action: "general_info", controller: "admin", json: @school_info.errors, status: :bad_request
        end
      end
    end
  end

  private

  def school_info_params 
    params.require(:school_info).permit(:title, :description, :page_type)
  end

  def find_school_info
    @school_info = SchoolInfo.find_by_slug!(params[:id].split("/").last)
  end
   
end
