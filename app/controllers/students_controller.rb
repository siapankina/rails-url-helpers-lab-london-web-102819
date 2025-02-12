class StudentsController < ApplicationController
  before_action :set_student, only: :show

  def index
    @students = Student.all
  end

  def show
  end

  def activate
    id = params[:id]
    @student = Student.find(id)
    if @student.active == true
      @student.active = false
    else
      @student.active = true
    end
    @student.save
    redirect_to student_path(@student)
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end
end
