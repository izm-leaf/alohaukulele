class WoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wood, only: [:update, :edit, :destroy]
  load_and_authorize_resource

  def index
    @woods = Wood.all
  end

  def new
    if params[:back]
      @wood = Wood.new(wood_params)
    else
      @wood = Wood.new
    end
  end

  def create
    @wood = Wood.new(wood_params)
    if @wood.save
      redirect_to woods_path, notice: "追加しました"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @wood.update(wood_params)
    redirect_to woods_path, notice: "編集しました"
  end

  def destroy
    @wood.destroy
    redirect_to woods_path, notice: "削除しました"
  end

  def confirm
    @wood = Wood.new(wood_params)
    render :new if @wood.invalid?
  end

private

  def wood_params
    params.require(:wood).permit(:name)
  end

  def set_wood
    @wood = Wood.find(params[:id])
  end

end
