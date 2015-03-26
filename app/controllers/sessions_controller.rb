class SessionsController < ApplicationController
  def new
  end

  def create
    user = General.first
    if user && user.authenticate(params[:session][:password])
      user.last_login = Time.now
      user.save!(:validate => false)
      session[:logged_in] = true
      redirect_to overview_path
    else
      flash[:error] = 'Invalid password'
      redirect_to root_url
    end
  end

  def destroy
    session[:logged_in] = false
    redirect_to root_url
  end
end
