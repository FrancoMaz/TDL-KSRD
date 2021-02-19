class CommentsShopController < ApplicationController
  def show
    @user = current_user
    @comments = current_user.comments.order('created_at desc')
    @user_url = url_for controller: 'comments', action: 'new', shop: current_user.hash_for_url
  end
end
