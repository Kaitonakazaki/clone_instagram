class InstagramsController < ApplicationController
   before_action :set_instagram, only: [:show,:edit,:update,:destroy]
   before_action :login_confirm, only: [:new,:edit,:show,:destroy]
   before_action :user_confirm, only: [:edit,:destroy]

  def index
    @instagrams = Instagram.all
  end

  def new
   if params[:back]
     @instagram = Instagram.new(instagram_params,user_id: @current_user.id)
   else
     @instagram = Instagram.new
   end
  end

  def create
    @instagram = Instagram.new(instagram_params)
    @instagram.user_id = current_user.id
    if @instagram.save
      InstagramMailer.instagram_mail(@instagram).deliver
      redirect_to instagrams_path, notice: "ブログ作成完了"
    else
      render 'new'
    end
  end

  def show
    @favorite = current_user.favorites.find_by(instagram_id: @instagram.id)
    @user = User.find_by(id: @instagram.user_id)
  end

  def edit
  end

  def update
    if @instagram.update(instagram_params)
      redirect_to instagrams_path, notice:'編集しました'
    else
      render 'edit'
    end
  end

  def destroy
    @instagram.destroy
    redirect_to instagrams_path, notice:'削除した'
  end

  def confirm
    @instagram = Instagram.new(instagram_params)
    @instagram.user_id = current_user.id
    render :new if @instagram.invalid?
  end

  private

  def instagram_params
    params.require(:instagram).permit(:title,:content,:image, :image_cache, :user_id)
  end

  def set_instagram
    @instagram = Instagram.find(params[:id])
  end

  def login_confirm
    redirect_to new_session_path unless logged_in?
  end

  def user_confirm
    @instagram = Instagram.find_by(id:params[:id])
    if @instagram.user_id != @current_user.id
      flash[:notice] = "ログインIDがちがいます"
      redirect_to instagrams_path
    end
  end
end
