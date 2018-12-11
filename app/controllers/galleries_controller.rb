class GalleriesController < ApplicationController
  include AuthorizationsHelper
  before_action :authorize_admin, except: [:index, :show]

  # GET /galleries
  def index
    @galleries = Gallery.all
  end

  # GET /galleries/1
  def show
    @gallery = Gallery.find(params[:id])
  end

  # GET /galleries/new
  def new
    @gallery = Gallery.new
  end

  # GET /galleries/1/edit
  def edit
    @gallery = Gallery.find(params[:id])
    @gallery_image = GalleryImage.new
  end

  # POST /galleries
  def create
    @gallery = Gallery.new(gallery_params)

    respond_to do |format|
  
      if @gallery.save
        if params[:gallery_images]
          params[:gallery_images].each do |image|
            @gallery.gallery_images.create(image: image)
          end
        end
        format.html do 
          flash[:notice] = "Gallery was Saved"
          redirect_to galleries_path
        end
        format.json do 
          render action: 'index', status: 'created', location: @gallery
        end
      else 
        format.html do 
          flash.now[:alert] = "There was an error in creating a gallery"
          render :new
        end
        format.json do 
          render json: @gallery.errors, status: :unprocessable_entity
        end
      end  
    end
    params.each do |par|
      puts par 
    end

  end

  # PATCH/PUT /galleries/1
  def update
    @gallery = Gallery.find(params[:id])
    @gallery.assign_attributes(gallery_params)
    respond_to do |format|
      if @gallery.save
        if params[:gallery_images]
          params[:gallery_images].each do |image|
            @gallery.gallery_images.create(image: image)
          end
        end
        format.html do 
          flash[:notice] = "Gallery was successfully updated"
          redirect_to galleries_path
        end
        format.json do 
          render action: "index", status: "updated", location: @gallery
        end
      else 
        format.html do 
          flash.now[:alert] = "Error saving the gallery"
          render :edit
        end
        format.json do 
          render json: @gallery.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /galleries/1
  def destroy
   @gallery = Gallery.find(params[:id])

   respond_to do |format| 
      if @gallery.destroy 
        format.html {redirect_to galleries_path, notice: "Gallery Was Deleted"}
        format.json {render action: "index", status: :deleted, locatin: @galleries }
      else 
        format.html {redirect_to galleries_path, notice: "Error Deleting Gallery"}
        format.json {render json: @gallery.errors, action: "index", status: :bad_request }
      end
    end
  end

  private

    def gallery_params
      params.require(:gallery).permit(:title, :description, {gallery_images_attributes: [:image, :gallery_id]})
    end
end
