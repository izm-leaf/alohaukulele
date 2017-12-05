class FavoritesController < ApplicationController

  def index
    @favorites = Favorite.all
  end

  def new
    if params[:back]
      @favorite = Favorite.new(favorites_params)
    else
      @favorite = Favorite.new
    end
  end

  def create
    @favorite = Favorite.new(favorites_params)
    if @favorite.save
      redirect_to favorites_path, notice: "投票しました！"
    else
      render 'new'
    end
  end

  def confirm
  end

private

  def favorites_params
    params.require(:favorite).permit(:size_id, :top_wood_id, :body_wood_id)
  end

end
