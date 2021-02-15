class LoginController < ApplicationController
  def index
  end

  def create
    /render :text => params[:post].inspect/
    redirect_to :controller => 'home', :action => 'show'
  end
end
