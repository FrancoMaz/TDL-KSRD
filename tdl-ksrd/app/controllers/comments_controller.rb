
class CommentsController < ApplicationController

  # GET /comments
  def index
    @user = current_user
    @comments = current_user.comments.order('created_at desc')
    @user_url = url_for controller: 'comments', action: 'new', shop: current_user.hash_for_url
  end

  # GET /comments/1
  def show
    @comment = Comment.find(params[:id])
  end

  # GET /comments/new
  def new
    @user = User.find_by_hash_for_url(params[:shop])
    if @user.nil?
      respond_to do |format|
        flash[:error] = "Verifique el nombre del comercio"
        format.html { redirect_to action: 'comment_error'}
      end
    end
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)
    @user = User.find(@comment.user_id)

    respond_to do |format|
      if @comment.save
        flash[:success] = "Recibimos tu comentario. ¡Gracias!"
        format.html { redirect_to action: 'comment_success'}
      else
        flash[:error] = "El campo de comentario no puede estar en blanco"
        format.html { redirect_to action: 'new' , shop: @user.hash_for_url}
      end
    end
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id, :name, :email, :rating, :category, :image)
  end

  def comment_success
  end

  def comment_error
  end

  private
  def send_notification_to(user_id, comment_data)
    @user = User.find(user_id)
    UserNotifierMailer.send_new_comment_notice(@user.email, comment_data.content, comment_data.name, comment_data.email).deliver
  end

end