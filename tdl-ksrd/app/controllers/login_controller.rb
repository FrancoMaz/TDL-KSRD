class LoginController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by("LOWER(email) = ?", user_params[:email].downcase)

    if @user.present? && @user.authenticate(user_params[:password])
      cookies.permanent.signed[:user_id] = @user.id
      redirect_to home_url
    else
      @user = User.new(user_params)
      @user.errors.add(:email, "El mail o la contraseña son incorrectos")
      render :new
    end
  end

  def destroy
    cookies.delete(:user_id)
    redirect_to "/"
  end

end

private

def user_params
  params.require(:user).permit(:email, :password)
end