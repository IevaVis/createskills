class TeachersSessionsController < ApplicationController
include TeachersSessionsHelper

  def new
  end

  def create
      teacher = Teacher.find_by(email: params[:session][:email])
      if teacher && teacher.authenticate(params[:session][:password])
        log_in teacher
        redirect_to root_path
        flash[:notice] = "Welcome!"
      else
          flash[:alert] = "Please log in again!"
          render 'new'
      end
    end

  def destroy
    log_out
      redirect_to root_path
  end
end