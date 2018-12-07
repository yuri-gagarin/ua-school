class CoursesController < ApplicationController
  include AuthorizationsHelper
  before_action :user_signed_in?, except: [:index, :show]
  before_action :authorize_teacher, except: [:index, :new, :create, :show], unless: -> {current_user && current_user.admin?}
  before_action :authorize_admin, except: [:index, :show], unless: -> {current_user && current_user.teacher?}


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
    @course.assign_attributes(course_params)
    respond_to do |format|
      if @course.save
        if params[:course_images]
          params[:course_images].each do |image|
            @course.course_images.create(image: image)
          end
        end
        format.html do 
          flash[:notice] = "Course was Updated Successfully"
          redirect_to courses_path 
        end
        format.json do 
          render action: 'index', status: 'updated', location: @course
        end
      else  
        format.html do 
          flash.now[:alert] = "Error saving the course"
          render :edit
        end
        format.json do
          render json: @course.errors, status: :unprocessable_entity
        end
      end
    end

  end

  def destroy
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.destroy
        format.html {redirect_to courses_path, notice: "Course Deleted"}
        format.json {render action: 'index', status: :deleted, location: @courses}
      else 
        format.html {redirect_to courses_path, notice: 'Error Deleting Course'}
        format.json {render json: @course.errors, action: 'index', status: :bad_request}
      end
    end
  end

  private

  def course_params 
    params.require(:course).permit(:name, :description, :user_id, course_images_attributes: [:image, :course_id] )
  end

  def authorize_teacher
    course = Course.find(params[:id])
    if current_user
      unless current_user.admin? || (current_user.teacher? && current_user.id == course.user_id)
        flash[:alert] = "You do not have administrative privileges"
        redirect_to(new_user_session_path)
      end
    else 
      redirect_to(new_user_session_path)
    end
  end


end
