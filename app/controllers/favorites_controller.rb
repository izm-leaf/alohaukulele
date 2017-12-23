class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_size_wood, only: [:index, :new, :create, :confirm]

  def index
    @favorites = Favorite.all
  end

  def new
    if params[:back]
      @favorite = Favorite.new(favorite_params)
    else
      @favorite = Favorite.new
    end
  end

  def create
    @favorite = Favorite.new(favorite_params)
    @favorite.user_id = current_user.id

    if @favorite.save
      flash[:success] = "ありがとうございました！"
      redirect_to favorites_path
    else
      render 'new'
    end
  end

  def confirm
    if params[:favorite].blank?
      flash[:warning] = "お好みの一本を選んでください"
      redirect_to new_favorite_path
    else
      @favorite = Favorite.new(favorite_params)
      render :new if @favorite.invalid?
    end
  end

private

  def favorite_params
    params.require(:favorite).permit(:size_id, :top_wood_id, :body_wood_id)
  end

  def set_size_wood
    @size = Size.all.order(:id)
    @wood = Wood.all.order(:id)
  end

end
