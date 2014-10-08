class AdminController < ApplicationController

  def new
  end

  def create
   session[:logged_in] = true
   flash[:notice] = 'Success, logged in'
   session[:password] = params[:password]
   redirect_to knowledgebase_path
  end

  def destroy
   reset_session
   flash[:notice] = 'Logged out'
   redirect_to knowledgebase_path
  end


end
