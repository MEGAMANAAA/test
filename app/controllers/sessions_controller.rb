class SessionsController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
  end

  def create
     user = User.find_by_email(params[:session][:email])

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      session[:user_name] = user.name
      redirect_to '/startpage'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
