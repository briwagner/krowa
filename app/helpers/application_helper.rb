module ApplicationHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def manageable(id)
  	current_user.id == id.to_i
  end
end
