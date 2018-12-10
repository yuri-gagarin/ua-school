class TeachersController < ApplicationController
  def index
    @teachers = User.where(role: 'teacher')
    puts @teachers
  end

  def show
    @teacher = User.find(params[:id])
  end
end
