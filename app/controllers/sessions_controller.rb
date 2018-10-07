class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      login user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to root_url
    end
    respond_to do |format|
      format.js
    end
  end
  def destroy
    logout if logged_in?
    redirect_to root_url
  end
end
