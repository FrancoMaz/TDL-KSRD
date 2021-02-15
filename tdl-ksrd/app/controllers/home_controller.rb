class HomeController < ApplicationController
  before_action :authenticate_user

  def show
    @user = current_user
    @user_url = Sysrandom.hex(32)
  end
end
