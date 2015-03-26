class StaticController < ApplicationController
  before_action :logged_in, only: [:overview]

  def overview
  end

  def login
    render layout: "empty"
  end

  def configure
    render layout: "empty"
  end

  def config1
    render layout: "empty"
    @user = General.new
  end

  def config_end
    render layout: "empty"
  end

  def password
    @user = General.new(user_params)
    if @user.save
      redirect_to config_end_path
    else
      flash.now[:error] = @user.errors.full_messages.uniq.join(", ")
      render "config1"
    end
  end

  private
    def user_params
      params.require(:general).permit(:password, :password_confirmation)
    end

end
