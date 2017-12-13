class WoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wood, only: [:update, :edit, :destroy]

  def index
    @woods = Wood.all
  end

  def new
    if params[:back]
      @wood = Wood.new(sizes_params)
    else
      @wood = Wood.new
    end
  end

  def create
    @wood = Wood.new(woods_params)
    if @wood.save
      redirect_to woods_path, notice: "追加しました"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @wood.update(woods_params)
    redirect_to woods_path, notice: "編集しました"
  end

  def destroy
    @wood.destroy
    redirect_to woods_path, notice: "削除しました"
  end

  def confirm
    @wood = Wood.new(woods_params)
    render :new if @wood.invalid?
  end

private

  def woods_params
    params.require(:wood).permit(:wood)
  end

  def set_wood
    @wood = Wood.find(params[:id])
  end

end
