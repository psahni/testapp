class TeachersController < ApplicationController



  def new
    @teacher =  Teacher.new
  end

  def index
  end


  def create
    @teacher = Teacher.new(params[:teacher])
    if @teacher.save
      render :json => {:notice => "Teacher has been saved successfully"}, :status => 200
    else
      render :json => @teacher.errors, :status => :unprocessable_entity
    end
  end


end
