class SessionsController < ApplicationController
  def new
    @temp_user = 1
  end
  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      login @user
      redirect_to root_url
    else

    end
  end
  def destroy
    logout
    redirect_to root_url
  end
end
