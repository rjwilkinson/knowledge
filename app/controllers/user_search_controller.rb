class UserSearchController < ApplicationController


  def show
  end

  def index
   @search_result = Search.new(params[:user_number]) if params[:user_number].present?

  end


  def handle_error
      flash[:notice] = "Sorry, something went wrong."
  end




end
