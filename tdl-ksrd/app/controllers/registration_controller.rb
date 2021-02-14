class RegistrationController < ApplicationController
  def registration
    'registration'
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new({:name => params[:post][:name], :email => params[:post][:email], :rubro => params[:post][:rubro], :password => params[:post][:password]})
    if @user.save
      redirect_to :action => :show, :id => @user.id
    else
      redirect_to(:action => 'registration')
    end

  end

  def show
    @post = User.find(params[:id])
  end
end

private
def sign_up_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation, :rubro)
end
