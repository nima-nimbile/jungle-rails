class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)

    if User.find_by(email: user.email)
      redirect_to '/signup'
    else
      if user.save
        session[:user_id] = user.id
        redirect_to '/'
      else
        redirect_to '/signup'
      end
    end

  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

end