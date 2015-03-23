module UsersHelper
  def is_admin? 
    current_user.role == "administrator"
  end

  def is_teacher? 
    current_user.role == "teacher"
  end
end
