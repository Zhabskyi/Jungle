class SessionsController < ApplicationController

  def index
  end

  def create

    user = User.find_by_email(params[:email])

    if user = User.new().authenticate_with_credentials(params[:email], params[:password])

      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to sessions_path
    end

  end

  def destroy
    session[:user_id] = nil
    
    redirect_to new_session_path
  end

end
