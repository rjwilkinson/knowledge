class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # See docs online for helper_method. This essentially allows any views to be able to access the stated method. Any methods placed here will be available to any controller.
 helper_method :admin?, :logged_in?
  
  def admin?
   session[:password] == 'foobs'
  end
  
  
#  def authorise
#   if admin?
#   redirect_to knowledgebase_path
#   false
#   end
#  end
  
  def logged_in?
   session[:password] == true
  end
  
end
