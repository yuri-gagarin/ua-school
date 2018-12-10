class IndexPostsController < ApplicationController
  include AuthorizationsHelper
  before_action :authorize_admin
  # GET /index_posts
  def index
    @index_posts = IndexPost.all
  end

  # GET /index_posts/1
  def show
    @index_post = IndexPost.find(params[:id])
  end

  # GET /index_posts/new
  def new
    @index_post = IndexPost.new
  end

  # GET /index_posts/1/edit
  def edit
    @index_post = IndexPost.find(params[:id])
  end


  # POST /index_posts
  def create
    @index_post = IndexPost.new
    parameters = index_post_params
    @index_post.title = parameters[:title]
    @index_post.description = parameters[:description]
    @index_post.page_type = parameters[:page_type].to_i
    respond_to do |format|
      if @index_post.save
        format.html do 
          flash[:notice] = "index_post Was Saved"
          redirect_to admin_path;
        end
        format.json do 
          render action: 'index', status: 'created', location: @index_post
        end
      else
        format.html do 
          flash.now[:alert] = 'There was an error in saving the index_post'
          render :new 
        end
        format.json do 
          render json: @index_post.errors, status: :unprocessable_entity 
        end
      end
    end
  end

  # PATCH/PUT /index_posts/1
  def update
    @index_post.title = index_post_params[:title]
    @index_post.description = index_post_params[:description]

    if @index_post.save
      format.html do 
        flash[:notice] = "Post was Updated Successfully"
        redirect_to admin_path
      end
      format.json do 
        render action: 'index', status: 'updated', location: @course
      end
    else  
      format.html do 
        flash.now[:alert] = "Error saving the post"
        render :edit
      end
      format.json do
        render json: @index_post.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /index_posts/1
  def destroy
    @index_post = IndexPost.find(params[:id])
    @index_post.destroy
    redirect_to admin_path, notice: 'Index post was successfully destroyed.'
  end

  private

    # Only allow a trusted parameter "white list" through.
    def index_post_params
      params.require(:index_post).permit(:title, :description, :page_type)
    end
end
