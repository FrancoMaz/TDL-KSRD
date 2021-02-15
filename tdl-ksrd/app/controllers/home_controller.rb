class HomeController < ApplicationController
  def show
    @user_url = Sysrandom.hex(32)
  end
end
