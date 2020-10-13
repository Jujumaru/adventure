class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
      if user && if user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        redirect_to user
      else
        flash.now[:danger] = 'This email/password combination does not exist'
        render 'new'
      end
    end
  end 

  def new
  end 
end