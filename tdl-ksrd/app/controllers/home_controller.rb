class HomeController < ApplicationController
  before_action :authenticate_user

  def show
    @user = current_user
    @user_url = url_for controller: 'comments', action: 'new', shop: @user.hash_for_url
  end
end
