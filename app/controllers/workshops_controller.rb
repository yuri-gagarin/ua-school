class WorkshopsController < ApplicationController
  include AuthorizationsHelper
  before_action :authorize_admin, except: [:index, :show]
  # GET /workshops
  def index
    @workshops = Workshop.all
    @index_post = IndexPost.where({page_type: 2}).first
    @index_post_image = @index_post.index_post_images[0]
    puts @index_post_image
  end

  # GET /workshops/1
  def show
    @workshop = Workshop.find(params[:id])
  end

  # GET /workshops/new
  def new
    @workshop = Workshop.new
  end

  # GET /workshops/1/edit
  def edit
    @workshop = Workshop.find(params[:id])
  end

  # POST /workshops
  def create 
    @workshop = Workshop.new(workshop_params)

    respond_to do |format|
      if @workshop.save
        if params[:workshop_images]
          params[:workshop_images].each do |image|
            @workshop.workshop_images.create(image: image)
          end
        end

        format.html do 
          flash[:notice] = "Workshop was saved"
          redirect_to admin_path
        end
        format.json do 
          render json: @workshop 
        end
      else
        format.html do
          flash.now[:alert] = "There was an error creating a workshop"
          render :new
        end
        format.json do 
          render json: @workshop.errors, status: :unprocessable_entity
        end
      end
    end
    #end save respond
  end

  # PATCH/PUT /workshops/1
  def update
    @workshop = Workshop.find(params[:id])
    @workshop.assign_attributes(workshop_params)
    respond_to do |format|
      if @workshop.save
        if params[:workshop_images]
          params[:workshop_images].each do |image|
            @workshop.workshop_images.create(image: image)
          end
        end
        format.html do
          flash[:notice] = "Workshop was successfully updated"
          redirect_to admin_path
        end
        format.json do 
          render json: @workshop
        end
      else
        format.html do 
          flash.now[:alert] = "Error saving the workshop"
          render :edit
        end
        format.json do 
          render json: @workshop.errors, status: :unprocessable_entity
        end
      end
    end
    #end update respond
  end

  # DELETE /workshops/1
  def destroy
    @workshop = Workshop.find(params[:id])
    respond_to do |format|
      if @workshop.destroy
        format.html {redirect_to admin_path, notice: "Workshop Deleted"}
      else
        format.html {redirect_to admin_path, notice: "Error Deleting Workshop"}
      end
    end
  end

  private   
    # Only allow a trusted parameter "white list" through.
    def workshop_params
      params.require(:workshop).permit(:name, :price, :instructor, :time, :room, :details, :description, workshop_images_attributes: [:image, :workshop_id])
    end
end
