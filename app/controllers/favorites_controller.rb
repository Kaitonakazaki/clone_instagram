class FavoritesController < ApplicationController

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
end
