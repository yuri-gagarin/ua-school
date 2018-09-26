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
    puts  @course.images[0].class
    if @course.save
     flash[:notice] = "Course Was Saved"
      redirect_to courses_path;
    else
      flash.now[:alert] = "There was an error in saving the course"
      render :new
    end

  end


  def edit
    @course = Course.find(params[:id])
    @course_images = @course.images;
  end

  def update 
    @course = Course.find(params[:id])

    if @course.update(course_params)
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
    params.require(:course).permit(:name, :description, :user_id, {images: []})
  end

  def authorize_user

    unless current_user.admin? || current_user.teacher?
      flash[:alert] = "You do not have administrative privileges"
      redirect_to courses_path
    end
  end


end
