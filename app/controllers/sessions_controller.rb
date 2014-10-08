class SessionsController < ApplicationController


  def new

  end

  def create
   unless params[:user_number].nil?
     @login_result = Search.login(params[:user_number], params[:postcode])
     if @login_result
       flash.now[:success] = "You have successfully signed in!"
       session[:logged_in] = true
       redirect_to knowledgebase_path
     else
       flash.now[:error] = "Those details didn't match, please try again."
       render 'new'
     end
   end
  end



end
