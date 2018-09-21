class CoursesController < ApplicationController
  before_action :require_sign_in, except: [:index, :show]
  before_action :authorize_user, except: [:index, :show]

  def index
    @courses = Course.all;
    @current_user = current_user || nil
  end

  def new 
    @course = Course.new
    @course_attachments = @course.course_attachments.build
  end

  def show
    @course = Course.find(params[:id])
    @course_attachments = @course.course_attachments.all
  end

  def create
 
    @course = Course.new(course_params)
    @course.user = current_user

    if @course.save
      params[:course_attachments]['image'].each do |img|
        @course_attachment = @course.course_attachments.create!(course_id: @course.id, image: img)

      end
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
    params.require(:course).permit(:name, :description, course_attachment_attributes: [:id, :course_id, :image])
  end

  def authorize_user

    unless current_user.admin? || current_user.teacher?
      flash[:alert] = "You do not have administrative privileges"
      redirect_to courses_path
    end
  end


end
