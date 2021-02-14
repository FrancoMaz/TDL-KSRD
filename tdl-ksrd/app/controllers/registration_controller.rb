class RegistrationController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
    if @user.save
      redirect_to :action => :show, :id => @user.id
    else
      render 'new'
    end

  end

  def show
    @user = User.find(params[:id])
  end
end

private
def sign_up_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation, :rubro)
end
