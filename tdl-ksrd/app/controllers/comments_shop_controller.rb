class CommentsShopController < ApplicationController
  def show
    @user = current_user
    @comments = current_user.comments.order('created_at desc')
  end
end
