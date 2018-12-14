class TeachersController < ApplicationController
  include AuthorizationsHelper
  before_action :authorize_admin, except: [:show]

  def index
    @teachers = User.where(role: 'teacher')
    puts @teachers
  end

  def new 
    @teacher = User.new
    @teacher_avatar= @teacher.avatar

  end

  def create
    @teacher = User.new(user_params)

    if (@teacher.password != @teacher.password_confirmation)
      redirect_to new_teacher_path
    end
    @teacher.role = 2
    @teacher.confirmed_at = Time.now.utc
    if (@teacher.save) 
      flash[:notice] = "Teacher Was Created"
      redirect_to admin_path
    else
      flash.now[:alert] = "Error Saving a Teacher"
      render :new
    end
  end



  def show
    @teacher = User.find(params[:id])
    @teachers_courses = @teacher.courses
  end


  private
  def user_params
    params.require(:user).permit(:name, :last_name, :email, :password, :description,  :password_confirmation, :grade, :avatar)
  end
end
