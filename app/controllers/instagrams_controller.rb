class InstagramsController < ApplicationController
   before_action :set_instagram, only: [:show,:edit,:update,:destroy]

  def index
    @instagrams = Instagram.all
  end

  def new
   if params[:back]
     @instagram = Instagram.new(instagram_params)
   else
     @instagram = Instagram.new
   end
  end

  def create
    @instagram = Instagram.new(instagram_params)
    if @instagram.save
      redirect_to instagrams_path, notice: "ブログ作成完了"
    else
      render 'new'
    end
  end

  def show
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
    render :new if @instagram.invalid?
  end

  private
  def instagram_params
    params.require(:instagram).permit(:title,:content)
  end

  def set_instagram
    @instagram = Instagram.find(params[:id])
  end
end
