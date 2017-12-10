class FavoritesController < ApplicationController

  def index
    @favorites = Favorite.all
  end

  def new
    @size = Size.all
    @wood = Wood.all

    if params[:back]
      @favorite = Favorite.new(favorites_params)
    else
      @favorite = Favorite.new
    end
  end

  def create
    @favorite = Favorite.new(favorites_params)
binding.pry
    if @favorite.save
      redirect_to favorites_path, notice: "投票しました！"
    else
      render 'new'
    end
  end

  def confirm
    @favorite = Favorite.new(favorites_params)
    @size = Size.find(@favorite.size_id) 
    @topwood = Wood.find(@favorite.top_wood_id) 
    @bodywood = Wood.find(@favorite.body_wood_id) 
    render :new if @favorite.invalid?
  end

private

  def favorites_params
    params.require(:favorite).permit(:size_id, :top_wood_id, :body_wood_id)
  end

end
