class SizesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_size, only: [:update, :edit, :destroy]
  load_and_authorize_resource

  def index
    @sizes = Size.all
  end

  def new
    if params[:back]
      @size = Size.new(size_params)
    else
      @size = Size.new
    end
  end

  def create
    @size = Size.new(size_params)
    if @size.save
      redirect_to sizes_path, notice: "追加しました"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @size.update(size_params)
    redirect_to sizes_path, notice: "編集しました"
  end

  def destroy
    @size.destroy
    redirect_to sizes_path, notice: "削除しました"
  end

  def confirm
    @size = Size.new(size_params)
    render :new if @size.invalid?
  end

private

  def size_params
    params.require(:size).permit(:name)
  end

  def set_size
    @size = Size.find(params[:id])
  end

end
