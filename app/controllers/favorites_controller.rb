class FavoritesController < ApplicationController
  before_action :login_confirm, only: [:index]

  def index
    @favorites_instagrams = current_user.favorite_instagrams
  end

  def create
    favorite = current_user.favorites.create(instagram_id: params[:instagram_id])
    redirect_to instagrams_url
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to instagrams_url
  end

  private
  
  def login_confirm
    redirect_to new_session_path unless logged_in?
  end

end
