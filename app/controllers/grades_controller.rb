class GradesController < ApplicationController
  include AuthorizationsHelper
  before_action :authorize_admin
  # GET /grades
  def index
    @grades = Grade.all
  end

  # GET /grades/1
  def show
    @grade = Grade.find(params[:id])
  end

  # GET /grades/new
  def new
    @grade = Grade.new
  end

  # GET /grades/1/edit
  def edit
    @grade = Grade.find(params[:id])
    @grade_image = GradeImage.new
  end

  # POST /grades
  def create
    @grade = Grade.new(grade_params)
    @grade.level = params[:level]

    if @grade.save 
      flash[:notice] = "Grade was created"
      redirect_to admin_grades_path
    else 
      flash[:now] = "Error creating a grade"
      render :new
    end

  end

  # PATCH/PUT /grades/1
  def update
    @grade = Grade.find(params[:id])
    if @grade.update(grade_params)
      flash[:notice] =  'Grade was successfully updated.'
      redirect_to admin_grades_path
    else
      render :edit
    end
  end

  # DELETE /grades/1
  def destroy
    @grade.destroy
    redirect_to grades_url, notice: 'Grade was successfully destroyed.'
  end

  private

    # Only allow a trusted parameter "white list" through.
    def grade_params
      params.require(:grade).permit(:description)
    end
end
