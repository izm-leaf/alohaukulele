class SizesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_size, only: [:update, :edit, :destroy]

  def index
    @sizes = Size.all
  end

  def new
    if params[:back]
      @size = Size.new(sizes_params)
    else
      @size = Size.new
    end
  end

  def create
    @size = Size.new(sizes_params)
    if @size.save
      redirect_to sizes_path, notice: "追加しました"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @size.update(sizes_params)
    redirect_to sizes_path, notice: "編集しました"
  end

  def destroy
    @size.destroy
    redirect_to sizes_path, notice: "削除しました"
  end

  def confirm
    @size = Size.new(sizes_params)
    render :new if @size.invalid?
  end

private

  def sizes_params
    params.require(:size).permit(:size)
  end

  def set_size
    @size = Size.find(params[:id])
  end

end
