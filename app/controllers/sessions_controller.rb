class SessionsController < ApplicationController
  def new; end

  def create
    email, password = login_params
    user = User.find_by(email: email)
    if user&.authenticate(password)
      flash[:success] = 'Login successfully'
      log_in user
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid email/password'
      render :new
    end
  end

  def destroy; end

  private

  def login_params
    p = params.require(:session).permit(:email, :password)

    [p[:email].downcase, p[:password]]
  end
end
