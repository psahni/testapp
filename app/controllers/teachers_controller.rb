class TeachersController < ApplicationController



  def new
    @teacher =  Teacher.new
  end

  def index
  end


  def create
    @teacher = Teacher.new(params[:teacher])
    if @teacher.save
    else
      render :json => @teacher.errors
    end
  end


end
