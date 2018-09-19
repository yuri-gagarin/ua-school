class CoursesController < ApplicationController
  before_action :require_sign_in, except: [:index, :show]
  before_action :authorize_user, except: [:index, :show]

  def index
    @courses = Course.all;
  end

  def new 
    @course = Course.new
  end

  def show
    @course = Course.find(params[:id])
  end

  def create
 
    @course = Course.new(course_params)
    @course.user = current_user

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
  end

  def update 
    @course = Course.find(params[:id])
    @course = assign_attributes(course_params)

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

    if @post.destroy
      flash[:notice] = "\"#{@course.name}\" was successfully deleted"
      redirect_to courses_path
    else 
      flash.now[:alert] = "There was an error deleting the course"
      render :show
    end
  end

  private

  def course_params 
    params.require(:course).permit(:name, :description)
  end

  def authorize_user

    unless current_user.admin? || current_user.teacher?
      flash[:alert] = "You do not have administrative privileges"
      redirect_to courses_path
    end
  end


end
