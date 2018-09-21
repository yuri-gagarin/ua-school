class CourseAttachmentsController < ApplicationController
  before_action :set_course_attachment, only: [:show, :edit, :update, :destroy]

  # GET /course_attachments
  def index
    @course_attachments = CourseAttachment.all
  end

  # GET /course_attachments/1
  def show
  end

  # GET /course_attachments/new
  def new
    @course_attachment = CourseAttachment.new
  end

  # GET /course_attachments/1/edit
  def edit
  end

  # POST /course_attachments
  def create
    @course_attachment = CourseAttachment.new(course_attachment_params)

    if @course_attachment.save
      redirect_to @course_attachment, notice: 'Course attachment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /course_attachments/1
  def update
    if @course_attachment.update(course_attachment_params)
      redirect_to @course_attachment, notice: 'Course attachment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /course_attachments/1
  def destroy
    @course_attachment.destroy
    redirect_to course_attachments_url, notice: 'Course attachment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_attachment
      @course_attachment = CourseAttachment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def course_attachment_params
      params.require(:course_attachment).permit(:course_id, :image)
    end
end
