class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_size_wood, only: [:index, :new, :create, :confirm]

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
    @favorite.user_id = current_user.id

    if @favorite.save
      redirect_to favorites_path, notice: "投票しました！"
    else
      render 'new'
    end
  end

  def confirm
binding.pry
    @favorite = Favorite.new(favorites_params)
    render :new if @favorite.invalid?
  end

private

  def favorites_params
    params.require(:favorite).permit(:size_id, :top_wood_id, :body_wood_id)
  end

  def set_size_wood
    @size = Size.all
    @wood = Wood.all
  end

end
