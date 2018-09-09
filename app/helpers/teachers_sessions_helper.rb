module TeachersSessionsHelper

  # Logs in the given user.
  def log_in(teacher)
    session[:teacher_id] = teacher.id
  end

    # Returns the current logged-in user (if any).
  def current_teacher
    @current_teacher ||= Teacher.find_by(id: session[:teacher_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_teacher.nil?
  end

   def log_out
    session.delete(:teacher_id)
    @current_teacher = nil
  end


end


