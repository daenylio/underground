class SessionsController < ApplicationController
  def new; end

  def create
    email, password, remember_me = login_params
    user = User.find_by(email: email)
    if user&.authenticate(password)
      flash[:success] = 'Login successfully'
      log_in user
      if remember_me
        remember user
      else
        forget user
      end
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid email/password'
      render :new
    end
  end

  def destroy
    log_out if logged_in?

    redirect_to root_url
  end

  private

  def login_params
    p = params.require(:session).permit(:email, :password, :remember_me)

    p[:email].downcase, p[:password], p[:remember_me]
  end
end
