class LoginController < ApplicationController
  def index
  end

  def create
    redirect_to :controller => 'home', :action => 'show'
  end
end
