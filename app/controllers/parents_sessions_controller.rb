class ParentsSessionsController < ApplicationController
include ParentsSessionsHelper

  def new
  end

  def create
      parent = Parent.find_by(email: params[:session][:email])
      if parent && parent.authenticate(params[:session][:password])
        log_in parent
        redirect_to root_path
        flash[:success] = "Welcome!"
      else
          flash[:danger] = "Please log in again!"
          render 'new'
      end
    end

  def destroy
    log_out
    flash[:success] = "You have logged out"
      redirect_to root_path
  end
end