class CoursesController < ApplicationController
  include AuthorizationsHelper
  before_action :user_signed_in?, except: [:index, :show]
  before_action :authorize_teacher, except: [:index, :new, :create, :show], unless: -> {current_user && current_user.admin?}
  before_action :authorize_admin, except: [:index, :show], unless: -> {current_user && current_user.teacher?}


  def index
    #@courses = Course.find(params[:course_id])
    @current_user = current_user || nil
    if (params[:grade])
      @grade = Grade.where(level: params[:grade])
      @courses = @grade[0].courses.order(time: "ASC")

    else 
      @courses = Course.order("RANDOM()").limit(3)
    end
  end

  def new 
    @course = Course.new
    @teachers = User.where(role: 'teacher').order(last_name: "ASC")
    @grades = Grade.order(level: "ASC")
    puts @teachers
  end

  def show
    @course = Course.find(params[:id])
    @course_teacher = User.find(@course.user_id)
    @panel = true;
  end

  def create
    @teachers = User.where(role: 'teacher')
    @course = Course.new(course_params)
    @course.user_id = params[:course_instructor][:user_id]
    @course.grade_id = params[:grade][:grade_id]

    respond_to do |format|
      if @course.save
        if params[:course_images]
          params[:course_images].each do |image|
            @course.course_images.create(image: image)
          end
        end
        format.html do 
          flash[:notice] = "Course Was Saved"
          redirect_to admin_courses_path;
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
    @course_image = CourseImage.new
    @grades = Grade.order(level: "ASC")
    @teachers = User.where(role: 'teacher').order(last_name: "ASC")
  end

  def update 
    @teachers = User.where(role: 'teacher')
    @grades = Grade.order(level: "ASC")
    @course = Course.find(params[:id])
    @course.user_id = params[:course_instructor][:user_id]
    @course.grade_id = params[:grade][:grade_id]
    @course.assign_attributes(course_params)
    puts course_params
    respond_to do |format|
      if @course.save
        if params[:course_images]
          params[:course_images].each do |image|
            @course.course_images.create(image: image)
          end
        end
        format.html do 
          flash[:notice] = "Course was Updated Successfully"
          redirect_to admin_courses_path
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
        format.html {redirect_to admin_path, notice: "Course Deleted"}
        format.json {render action: 'index', status: :deleted, location: @courses}
      else 
        format.html {redirect_to admin_path, notice: 'Error Deleting Course'}
        format.json {render json: @course.errors, action: 'index', status: :bad_request}
      end
    end
  end

  private

  def course_params 
    params.require(:course).permit(:name, :description, :room, :time, course_images_attributes: [:image, :course_id] )
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
