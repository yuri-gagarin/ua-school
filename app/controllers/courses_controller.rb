class CoursesController < ApplicationController
  include AuthorizationsHelper
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_admin, except: [:index, :show]

  def index
    @courses = Course.all;
    @current_user = current_user || nil

  end

  def new 
    @course = Course.new
  end

  def show
    @course = Course.find(params[:id])
  end

  def create

    @course = Course.new(course_params)
    @course.user_id = current_user.id

    respond_to do |format|
      if @course.save
        if params[:course_images]
          params[:course_images].each do |image|
            @course.course_images.create(image: image)
          end
        end
        format.html do 
          flash[:notice] = "Course Was Saved"
          redirect_to courses_path;
        end
        format.json do 
          render action: 'index', status: 'created', location: @course
        end
      else
        format.html do 
          flash.now[:alert] = 'There was an error in saving the course'
          render :new 
        end
        format.json do 
          render json: @course.errors, status: :unprocessable_entity 
        end
      end
    end

  end


  def edit
    @course = Course.find(params[:id])
  end

  def update 
    @course = Course.find(params[:id])
    
    if @course.images.length > 0
      @course.name = course_params[:name]
      @course.description = course_params[:description]
      @course.images += course_params[:images]

      puts @course.images.length 

    end


    if @course.save 
      flash[:notice] = "Success!"
      redirect_to courses_path
    else  
      flash.now[:alert] = "Error saving the course"
      render :edit
    end
  end

  def destroy
    @course = Course.find(params[:id])

    if @course.destroy
      flash[:notice] = "\"#{@course.name}\" was successfully deleted"
      redirect_to courses_path
    else 
      flash.now[:alert] = "There was an error deleting the course"
      render :show
    end
  end

  private

  def course_params 
    params.require(:course).permit(:name, :description, :user_id, course_images_attributes: [:image, :course_id] )
  end

  def authorize_user

    unless current_user.admin? || current_user.teacher?
      flash[:alert] = "You do not have administrative privileges"
      redirect_to courses_path
    end
  end


end
